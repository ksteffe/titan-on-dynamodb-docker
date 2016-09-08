FROM maven:3.3.3-jdk-8

MAINTAINER Diego Ferri <diego.ferri@looptribe.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git zip curl

RUN curl -o /opt/titan.zip https://s3.amazonaws.com/dynamodb-titan-us-east-1/dynamodb-titan100-storage-backend-1.0.0-hadoop1.zip

RUN unzip /opt/titan.zip -d /opt/ && \
    rm /opt/titan.zip

WORKDIR /opt/dynamodb-titan100-storage-backend-1.0.0-hadoop1

ENV DYNAMODB_CONFIG dynamodb-local.properties
ENV DYNAMODB_ENDPOINT http://brainframe__dynamodb-local:8000

ADD $DYNAMODB_CONFIG conf/gremlin-server/
RUN sed -i 's@DYNAMODB_ENDPOINT@'"$DYNAMODB_ENDPOINT"'@g' conf/gremlin-server/$DYNAMODB_CONFIG

ADD gremlin-server-local.yaml conf/gremlin-server/

EXPOSE 8182
EXPOSE 8183
EXPOSE 8184

CMD ["bin/gremlin-server.sh", "conf/gremlin-server/gremlin-server-local.yaml"]