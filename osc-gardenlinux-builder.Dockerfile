FROM golang:1.20-bullseye AS onmetal-image-builder

WORKDIR /tmp/
RUN git clone https://github.com/onmetal/onmetal-image.git
WORKDIR /tmp/onmetal-image
RUN mkdir -p /bin
RUN make install
RUN make build
RUN chmod +x bin/onmetal-image
RUN mv bin/onmetal-image /usr/bin/onmetal-image

FROM ghcr.io/gardenlinux/builder:002a2ff4d1dc6a39d04543b6a6e92a1465d9e226
COPY --from=onmetal-image-builder /usr/bin/onmetal-image /usr/bin/
