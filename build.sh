#!/bin/bash

BASE_URL='http://distfiles.gentoo.org/releases/amd64/autobuilds'
ISO_NAME='install-amd64-minimal'

STAGE_3='20201004T214503Z'
BASE_DISK_SIZE='60000'
SHA_512=$(curl -s ${BASE_URL}/${STAGE_3}/${ISO_NAME}-${STAGE_3}.iso.DIGESTS |grep SHA512 -A1 |grep -P "iso$" | cut -d' ' -f1)

HEADLESS='true'
BUILD_MEM='8192'
BUILD_CPU='6'
FINAL_MEM='512'
FINAL_CPU='1'
PARALLEL='1'

packer build \
    -var stage_3="${STAGE_3}" \
    -var base_disk_size="${BASE_DISK_SIZE}" \
    -var sha_512="${SHA_512}" \
    -var build_mem="${BUILD_MEM}" \
    -var build_cpu="${BUILD_CPU}" \
    -var final_mem="${FINAL_MEM}" \
    -var final_cpu="${FINAL_CPU}" \
    -var headless="${HEADLESS}" \
    -force \
    -parallel-builds="${PARALLEL}" \
    virtualbox.json
