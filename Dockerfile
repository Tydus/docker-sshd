FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y install ca-certificates locales openssh-server screen --no-install-recommends && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN mkdir /var/run/sshd
#RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/StrictModes yes/StrictModes no/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-e"]

