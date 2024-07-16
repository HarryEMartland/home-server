docker run -i --rm -v .:/data -w /data \
 quay.io/coreos/butane:release --pretty --strict  --files-dir /data < config.bu > config.ign

rm isos/custom.iso


KERNEL_ARG='--live-karg-append=coreos.liveiso.fromram'
IGNITION_ARG='--live-ignition=./config.ign'

docker run --rm \
    -v .:/data -w /data \
    quay.io/coreos/coreos-installer:release \
     iso customize $KERNEL_ARG $IGNITION_ARG \
    --dest-ignition config.ign \
    --dest-device /dev/sda \
    -o ./isos/custom.iso ./isos/fedora-coreos-40.20240616.3.0-live.aarch64.iso