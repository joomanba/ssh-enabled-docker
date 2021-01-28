FROM centos:latest

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd; yum clean all

RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN echo 'root:Passw0rd' | chpasswd

ENTRYPOINT ["/usr/sbin/init"]