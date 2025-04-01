FROM cgr.dev/chainguard/rust AS builder

ARG TARGET

WORKDIR /app
COPY . .

RUN --mount=type=cache,target=/usr/local/cargo/registry --mount=type=cache,target=target
RUN RUSTFLAGS="-C target-feature=+crt-static" cargo build --release --target ${TARGET:?}

FROM cgr.dev/chainguard/static AS runtime

ARG TARGET

WORKDIR /app
COPY --from=builder /app/target/${TARGET:?}/release/kubeplane-operator /app/kubeplane-operator

ENTRYPOINT ["/app/kubeplane-operator"]