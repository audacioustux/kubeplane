FROM cgr.dev/chainguard/rust AS build

USER root

ARG TARGET
ARG PROFILE
ARG BIN

WORKDIR /app
COPY . .

ENV RUSTFLAGS="-C target-feature=+crt-static"
RUN --mount=type=cache,target=target --mount=type=cache,target=/usr/local/cargo \
    cargo build --target ${TARGET:?} --bin ${BIN:?} ${PROFILE:+--profile $PROFILE} \
    cp target/${TARGET:?}/${PROFILE:-debug}/${BIN:?} /entrypoint

FROM cgr.dev/chainguard/static AS runtime

COPY --from=build /entrypoint /

ENTRYPOINT ["/entrypoint"]