FROM ubuntu:24.10

RUN  apt update &&  apt install python3-dev gcc libc-dev libffi-dev

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /home/appuser

USER appuser
# Set PATH so pip --user executables are found
ENV PATH="/home/appuser/.local/bin:${PATH}"

RUN  python3 -m pip install --user ansible



