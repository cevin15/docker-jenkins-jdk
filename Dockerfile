FROM ubuntu:14.04
ENV JAVA_HOME=/var/jdk
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=$JAVA_HOME/jre/lib/rt.jar:.
ENV JENKINS_HOME /var/jenkins_home

VOLUME /var/jdk
VOLUME /var/jenkins_home
VOLUME /opt/data

//设置时区为东八区
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

//安装git客户端
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


EXPOSE 8080
EXPOSE 50000

ENTRYPOINT ["java", "-jar", "/opt/data/jenkins.war"]
