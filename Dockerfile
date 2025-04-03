FROM rust AS build

USER root

ARG CRATE
ARG TARGET
ARG PROFILE

WORKDIR /app
COPY . .

RUN rustup target add ${TARGET:?} && rustup show

ENV RUSTFLAGS="-C target-feature=+crt-static"
RUN --mount=type=cache,target=target --mount=type=cache,target=/usr/local/cargo/registry \
    cargo build --target ${TARGET:?} --bin ${CRATE:?} --profile ${PROFILE} && \
    cp target/${TARGET:?}/$(echo $PROFILE | sed 's/^dev$/debug/')/${CRATE:?} /entrypoint

FROM cgr.dev/chainguard/static AS runtime

COPY --from=build /entrypoint /

ENTRYPOINT ["/entrypoint"]