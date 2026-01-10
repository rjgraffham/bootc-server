# clean up past output if necessary, and create output dir
if (Test-Path output) {
    Remove-Item -Recurse output
}
New-Item -ItemType Directory output

# build the image
podman build --platform linux/amd64 --tag bootc-server -f Containerfile

# convert the container into a bootable image
podman run `
    --rm `
    -it `
    --privileged `
    --pull=newer `
    --security-opt label=type:unconfined_t `
    -v ./output:/output `
    -v /var/lib/containers/storage:/var/lib/containers/storage `
    quay.io/centos-bootc/bootc-image-builder:latest `
    --type vmdk `
    --target-arch amd64 `
    --rootfs btrfs `
    --use-librepo=True `
    localhost/bootc-server:latest