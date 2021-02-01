FROM geerlingguy/docker-centos7-ansible

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd; yum clean all

RUN mkdir /var/run/sshd

RUN useradd centos
RUN echo 'centos:Passw0rd' | chpasswd
RUN echo 'centos ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN mkdir /home/centos/.ssh
RUN ssh-keygen -t rsa -P '' -f /home/centos/.ssh/id_rsa

ENTRYPOINT ["/usr/sbin/init"]