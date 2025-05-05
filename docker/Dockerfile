FROM ubuntu:focal

RUN   apt update &&   apt install -y python3-dev python3-pip 
# gcc libc-dev libffi-dev

# RUN adduser --system  appuser 

# WORKDIR /home/appuser

# USER appuser
# Set PATH so pip --user executables are found
# ENV PATH="/home/appuser/.local/bin:${PATH}"

RUN  python3 -m pip install  ansible


