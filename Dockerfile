FROM rust:1.61.0 as builder
WORKDIR /usr/src/app

# Copy codes
COPY src src
COPY Cargo.lock .
COPY Cargo.toml .
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/rs-actions-helloworld /usr/local/bin/app

ENTRYPOINT [ "/usr/local/bin/app" ]