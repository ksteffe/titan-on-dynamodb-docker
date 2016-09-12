#!/bin/bash
cd ../../ && mvn test -Pstart-dynamodb-local &
echo "Waiting for DynamoDB Storage Backend for Titan 1.0.0 to launch on 4567..."

while ! nc -z localhost 4567; do
  sleep 0.1
done

echo "DynamoDB Storage Backend for Titan 1.0.0 launched"

bin/gremlin-server.sh ${PWD}/conf/gremlin-server/gremlin-server-local.yaml &
echo "Waiting for Titan 1.0.0 to launch on 8182..."

while ! nc -z localhost 8182; do
  sleep 0.1
done

echo "Titan 1.0.0 launched"