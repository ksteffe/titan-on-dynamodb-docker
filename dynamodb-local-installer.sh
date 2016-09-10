#!/bin/bash
mvn test -Pstart-dynamodb-local &
echo "Waiting for DynamoDB Storage Backend for Titan 1.0.0 to build and launch on 4567..."

while ! nc -z localhost 4567; do
  sleep 0.1
done

echo "DynamoDB Storage Backend for Titan 1.0.0 built and launched"

killall java

echo "DynamoDB Storage Backend for Titan 1.0.0 stopped"