FROM centos:6
MAINTAINER siniida <sinpukyu@gmail.com>

RUN yum update -y
RUN yum install -y tar

RUN curl -L -O -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jre-7u80-linux-x64.rpm
RUN rpm -ivh jre-7u80-linux-x64.rpm && rm jre-7u80-linux-x64.rpm

RUN curl https://s3-ap-northeast-1.amazonaws.com/gennai/release/gungnir-client-0.0.1-bin.tar.gz | tar zx -C /opt
RUN chown -R root:root /opt/gungnir-client-0.0.1
RUN ln -s /opt/gungnir-client-0.0.1 /opt/gungnir-client

RUN yum clean all

ENV JAVA_HOME /usr/java/default

WORKDIR /opt/gungnir-client

ADD entry.sh /

ENTRYPOINT ["/entry.sh"]
CMD ["/opt/gungnir-client/bin/gungnir", "-u root", "-p gennai"]
