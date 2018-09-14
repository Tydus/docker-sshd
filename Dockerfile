FROM ubuntu:16.04

RUN apt-get -y update && \
    apt-get -y install ca-certificates locales openssh-server vim screen --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* && \
    locale-gen en_US.UTF-8 && \
    mkdir /var/run/sshd && \
    sed -i 's/StrictModes yes/StrictModes no/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
    rm -v /etc/ssh/ssh_host_*


ENV LANG en_US.UTF-8

COPY start /

#RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login

#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/start"]

