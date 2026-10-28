#!/bin/sh
set -e
case $1 in
    amd64)
        ARCH="64"
        FNAME="amd64"
        ;;
    i386)
        ARCH="32"
        FNAME="i386"
        ;;
    armv8 | arm64 | aarch64)
        ARCH="arm64-v8a"
        FNAME="arm64"
        ;;
    armv7 | arm | arm32)
        ARCH="arm32-v7a"
        FNAME="arm32"
        ;;
    armv6)
        ARCH="arm32-v6"
        FNAME="armv6"
        ;;
    *)
        ARCH="64"
        FNAME="amd64"
        ;;
esac
# mtg-multi is an optional MTProto sidecar: the image builds and runs without
# it (only MTProto/FakeTLS inbounds stay unavailable). If the fork has no
# releases yet, skip its download instead of failing the whole build.
MTG_MULTI_VER=$(curl -sfL "https://api.github.com/repos/mrDuckdevX/mtg-multi/releases/latest" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p' | head -n 1) || true
mkdir -p build/bin
cd build/bin
curl -sfLRO "https://github.com/XTLS/Xray-core/releases/download/v26.9.30/Xray-linux-${ARCH}.zip"
unzip "Xray-linux-${ARCH}.zip"
rm -f "Xray-linux-${ARCH}.zip" geoip.dat geosite.dat
mv xray "xray-linux-${FNAME}"
# mtg-multi (MTProto sidecar) ships prebuilt release binaries for every target
# we package, so download and unpack the matching one instead of compiling.
case $FNAME in
    i386) MTGARCH="386" ;;
    arm32) MTGARCH="armv7" ;;
    *) MTGARCH="$FNAME" ;;
esac
if [ -n "$MTG_MULTI_VER" ]; then
    MTG_PKG="mtg-multi-${MTG_MULTI_VER#v}-linux-${MTGARCH}"
    if curl -sfLRO "https://github.com/mrDuckdevX/mtg-multi/releases/download/${MTG_MULTI_VER}/${MTG_PKG}.tar.gz"; then
        tar -xzf "${MTG_PKG}.tar.gz"
        mv "${MTG_PKG}/mtg-multi" "mtg-linux-${FNAME}"
        rm -rf "${MTG_PKG}" "${MTG_PKG}.tar.gz"
        chmod +x "mtg-linux-${FNAME}"
    else
        echo "DockerInit: mtg-multi asset ${MTG_PKG}.tar.gz not found; building without the MTProto sidecar" >&2
    fi
else
    echo "DockerInit: mrDuckdevX/mtg-multi has no releases; building without the MTProto sidecar" >&2
fi
curl -sfLRO https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
curl -sfLRO https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
curl -sfLRo geoip_IR.dat https://github.com/chocolate4u/Iran-v2ray-rules/releases/latest/download/geoip.dat
curl -sfLRo geosite_IR.dat https://github.com/chocolate4u/Iran-v2ray-rules/releases/latest/download/geosite.dat
curl -sfLRo geoip_RU.dat https://github.com/runetfreedom/russia-v2ray-rules-dat/releases/latest/download/geoip.dat
curl -sfLRo geosite_RU.dat https://github.com/runetfreedom/russia-v2ray-rules-dat/releases/latest/download/geosite.dat
cd ../../
