
FROM ubuntu:18.04
# FROM geerlingguy/docker-ubuntu1804-ansible

# RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y openssh-server
RUN apt-get update && apt-get install -y sudo vim 
RUN mkdir /var/run/sshd
RUN echo 'root:Passw0rd' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN useradd -m -d /home/ubuntu -s /bin/bash ubuntu
RUN echo 'ubuntu:Passw0rd' | chpasswd
RUN echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN mkdir /home/ubuntu/.ssh
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]