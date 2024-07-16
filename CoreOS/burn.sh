docker run  --rm \
    -v /dev:/dev -v /run/udev:/run/udev -v .:/data -w /data \
    quay.io/coreos/coreos-installer:release \
    install /dev/disk4 -i config.ign -- --cdrom isos/custom.iso