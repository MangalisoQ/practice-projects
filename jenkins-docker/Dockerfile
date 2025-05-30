FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt update && apt install -y ca-certificates curl 
RUN install -m 0755 -d /etc/apt/keyrings  
RUN curl -fsSL \
    https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc

# For different distributions, replace linux distro name 'ubuntu' and code version name 'oracular'
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
     https://download.docker.com/linux/ubuntu \
    oracular stable" | \
     tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update && apt install -y docker-ce-cli

RUN groupadd -f docker && usermod -aG docker jenkins

# USER jenkins
