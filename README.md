# titan-on-dynamodb
All-in-one Docker image for Titan 1.0.0 with DynamoDB backend.

DynamoDB runs as local daemon and only listens to localhost (internal port 4567). Titan listens on ports 818[2-4].

Adapted version of the [official AWS documentation](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.TitanDB.DownloadingAndRunning.html) for running DynamoDB backend for Titan.