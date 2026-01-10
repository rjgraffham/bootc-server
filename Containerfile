FROM quay.io/fedora/fedora-bootc:43

# increase minimum logging level to kernel console
RUN echo 'kernel.printk=4' > /etc/sysctl.d/10-kernel-printk.conf

# enable podman socket
RUN systemctl enable podman.socket

# embed quadlets (automatically enabled at boot)
COPY containers/* /etc/containers/systemd

# Run bootc lints against the container
RUN bootc container lint