FROM sburn/apache-atlas:2.3.0

RUN apt update && \
    apt install --no-install-recommends -y nano && \
    wget https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz && \
    tar zxvf apache-hive-3.1.2-bin.tar.gz && \
    mv apache-hive-3.1.2-bin /usr/local/hive && \
    rm apache-hive-3.1.2-bin.tar.gz && \
    rm /usr/local/hive/lib/log4j-slf4j-impl-2.10.0.jar && \
    rm /usr/local/hive/lib/guava-19.0.jar

COPY guava-27.0-jre.jar /usr/local/hive/lib/

ENV HIVE_HOME=/usr/local/hive
ENV PATH=$PATH:$HIVE_HOME/bin
ENV HADOOP_HOME=/opt/hadoop-3.2.1
