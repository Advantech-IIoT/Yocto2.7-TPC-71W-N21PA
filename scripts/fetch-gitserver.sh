#!/bin/bash
# advantechralph_url=https://github.com/advantechralph
advantechralph_url=.
advantechralph_names="yocto"
yocto_url=git://git.yoctoproject.org
yocto_names="poky meta-freescale"
community_url=git://github.com/Freescale
community_names="fsl-community-bsp-base meta-freescale-3rdparty meta-freescale-distro"
oe_url=git://github.com/openembedded
oe_names="meta-openembedded"
OSSystems_url=git://github.com/OSSystems
OSSystems_names="meta-browser"
QT5_url=git://github.com/meta-qt5
QT5_names="meta-qt5"
Timesys_url=git://github.com/TimesysGit
Timesys_names="meta-timesys"
rust_url=git://github.com/meta-rust
rust_names="meta-rust"
CAF_url=https://source.codeaurora.org/external/imx
CAF_names="meta-fsl-bsp-release"

list="yocto community oe OSSystems QT5 Timesys rust CAF"

mkdir -p  advantechralph
git clone --bare $(git rev-parse --show-toplevel) advantechralph/yocto
for l in $list ; do
  eval "url=\${${l}_url}"
  eval "names=\${${l}_names}"
  echo "url='$url', names='$names'"
  echo "  mkdir -p $l"
  if [ -n "$names" ] ; then
    for n in $names ; do 
      echo "  git clone --bare ${url}/${n} ${l}/${n}"
      git clone --bare ${url}/${n} ${l}/${n}
    done
  fi
done

