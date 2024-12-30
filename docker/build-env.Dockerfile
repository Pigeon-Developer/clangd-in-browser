FROM debian:12


RUN apt update && apt install vim git build-essential cmake ninja-build python3 wget -y


ENV WORKSPACE_DIR=/app
RUN mkdir -p $WORKSPACE_DIR/public/wasm/
COPY build.sh /app/build.sh
COPY wait_stdin.patch /app/wait_stdin.patch
RUN cd $WORKSPACE_DIR && ./build.sh
