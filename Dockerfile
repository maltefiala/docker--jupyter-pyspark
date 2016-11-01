FROM produktion/jupyter-openjdk

MAINTAINER Enproduktion <n@produktion.io>

USER root

ADD http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.deb /tmp
RUN dpkg -i /tmp/scala-2.11.8.deb

ADD http://d3kbcqa49mib13.cloudfront.net/spark-2.0.1-bin-hadoop2.7.tgz /tmp
RUN mkdir /spark \
 && tar -xvzf /tmp/spark-2.0.1-bin-hadoop2.7.tgz -C /spark --strip-components=1

ENV SPARK_HOME /spark
ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.3-src.zip

# Expose Spark Server
EXPOSE 7077

# Expose Webinterface
EXPOSE 8080

# Expose REST Server
EXPOSE 6066

USER $NB_USER

# Set scratch directory for workers
VOLUME ["/scratch"]
