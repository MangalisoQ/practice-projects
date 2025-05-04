FROM python:3.14.0a7-alpine3.21

RUN adduser -D appuser && apk update && apk add --no-cache python3-dev gcc libc-dev libffi-dev

USER appuser
WORKDIR /home/appuser

# Set PATH so pip --user executables are found
ENV PATH="/home/mike/.local/bin:${PATH}"

RUN  python3 -m pip install --user ansible



