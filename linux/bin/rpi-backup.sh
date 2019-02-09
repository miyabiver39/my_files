#!/bin/bash

# バックアップ対象のSDカードのデバイス取得
# /dev/sdb1: LABEL="boot" UUID="XXXX-XXXX" TYPE="vfat" PARTUUID="x9999999-99"
# ↑~~~~~~↑ need
PARTUUID='c8412251-01'
TARGET_DEV=`blkid|grep ${PARTUUID}|cut -c 1-8`

# sdc disk check
if [ -e ${TARGET_DEV} ]; then
  #rpi clone start
  cat <<EOF | rpi-clone ${TARGET_DEV}
yes

EOF
else
  echo "failed to not found ${TARGET_DEV}"
fi

#https://qiita.com/tsukaman/items/240888d360cc58ac2a04
