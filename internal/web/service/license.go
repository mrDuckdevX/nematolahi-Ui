package service

import (
	"crypto/hmac"
	"crypto/sha256"
	"encoding/hex"
	"errors"
	"strconv"
	"strings"
	"time"
)

// LicenseStatus is the public view of the panel license state.
type LicenseStatus struct {
	Active    bool       `json:"active"`
	Key       string     `json:"key"`
	Hwid      string     `json:"hwid,omitempty"`
	ExpiresAt *time.Time `json:"expiresAt,omitempty"`
	Plan      string     `json:"plan,omitempty"`
	IssuedBy  string     `json:"issuedBy,omitempty"`
}

const licenseSettingKey = "panelLicense"

var (
	ErrInvalidLicense      = errors.New("invalid license")
	ErrLicenseHwidMismatch = errors.New("license hwid mismatch")
	ErrLicenseExpired      = errors.New("license expired")
)

// SignLicense produces a Nematollahi-UI license token for a payload.
// Format: <payload>.<hex hmac-sha256(secret, payload)>
// Payload format: "plan|hwid|expiresUnix" (hwid may be empty to bind to any machine).
func SignLicense(secret []byte, payload string) string {
	mac := hmac.New(sha256.New, secret)
	mac.Write([]byte(payload))
	return payload + "." + hex.EncodeToString(mac.Sum(nil))
}

// VerifyLicense validates signature, HWID binding and expiry.
func VerifyLicense(secret []byte, token string, hwid string) (*LicenseStatus, error) {
	token = strings.TrimSpace(token)
	parts := strings.SplitN(token, ".", 2)
	if len(parts) != 2 || parts[0] == "" || parts[1] == "" {
		return nil, ErrInvalidLicense
	}
	payload, sig := parts[0], parts[1]

	mac := hmac.New(sha256.New, secret)
	mac.Write([]byte(payload))
	expected := hex.EncodeToString(mac.Sum(nil))
	if !hmac.Equal([]byte(sig), []byte(expected)) {
		return nil, ErrInvalidLicense
	}

	fields := strings.Split(payload, "|")
	if len(fields) != 3 {
		return nil, ErrInvalidLicense
	}
	exp, err := strconv.ParseInt(fields[2], 10, 64)
	if err != nil {
		return nil, ErrInvalidLicense
	}
	expTime := time.Unix(exp, 0)

	st := &LicenseStatus{
		Key:       maskLicenseKey(token),
		Plan:      fields[0],
		ExpiresAt: &expTime,
	}
	if fields[1] != "" && fields[1] != hwid {
		return nil, ErrLicenseHwidMismatch
	}
	st.Hwid = fields[1]
	st.Active = time.Now().Before(expTime)
	return st, nil
}

// maskLicenseKey hides the middle of the license token for safe display.
func maskLicenseKey(token string) string {
	if len(token) <= 12 {
		return token
	}
	return token[:6] + "..." + token[len(token)-4:]
}
