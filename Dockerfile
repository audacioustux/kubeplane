FROM rust AS build

USER root

ARG TARGET

WORKDIR /app
COPY . .

RUN rustup target add ${TARGET:?} && rustup show

ENV RUSTFLAGS="-C target-feature=+crt-static"
RUN --mount=type=cache,target=target --mount=type=cache,target=/usr/local/cargo/registry \
    cargo build --bins --target ${TARGET:?} && \
    find target/${TARGET:?}/release -maxdepth 1 -type f -executable -exec cp '{}' bin \;

FROM cgr.dev/chainguard/static AS bins

ENV PATH=/bin:$PATH

COPY --from=build /app/bin /

ENTRYPOINT ls /bin