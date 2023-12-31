@echo off
REM Build and Run Containers
docker-compose build
docker-compose up -d

REM Submit the Spark Job
docker-compose exec spark-master spark-submit --class consumer --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.4,org.elasticsearch:elasticsearch-spark-30_2.12:8.8.2,commons-httpclient:commons-httpclient:3.1 pyspark_consumer.py

REM Run Kafka Producer Script
python ./kafka_producer.py

echo Done
pause