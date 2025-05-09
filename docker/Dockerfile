FROM ubuntu:24.04

#RUN apt update 
#RUN apt install -y python3.12 python3-pip 

#RUN adduser --system  appuser 
# gcc libc-dev libffi-dev
#WORKDIR /home/appuser
# RUN adduser --system  appuser 
#ENV VIRTUAL_ENV=/opt/venv
#RUN python3 -m venv $VIRTUAL_ENV
#ENV PATH="$VIRTUAL_ENV/bin:$PATH"# WORKDIR /home/appuser

#USER appuser
# Set PATH so pip --user executables are found
#ENV PATH="/home/root/.local/bin:${PATH}"
#RUN  python3 -m pip install  ansible

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    curl


RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"


RUN pip install --upgrade pip && pip install ansible
