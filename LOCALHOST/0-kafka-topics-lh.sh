############# KAFKA CLI #################

# $PATH variable to be set correctly to invoke CLI commands create , delete, describe etc... to work with topics

# zookeeper is being removed
use the --bootstrap-server option everywhere , not --zookeeper

kafka-topics --bootstrap-server localhost:9092
kafka-topics --zookeeper localhost:9092

~~~~~~~~KAFKA Topics CLI~~~~~~~~~~
Kafka Topic Management = create, list, describe topics and increase partitions in a topics, delete a topic


# Create, delete, describe, or change a topic. - .sh for linux ubuntu
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh
# works if command description deatils appear

execute all commands listed in script file - 0-kafka-topics.sh  in 
PATH C:\Users\Aashrita\Downloads\kafka-for-beginners-code-20230404\code\1-kafka-cli

https://www.conduktor.io/kafka/kafka-topics-cli-tutorial/ 

# create a Kafka topic
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --create --partitions 3 --replication-factor 1
# WARNING: Due to limitations in metric names, topics with a period ('.') or underscore ('_') could collide. To avoid issues it is best to use either, but not both.
Created topic first_topic.

#list Kafka Topics
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --list
# first_topic

# this will create a topic with an RF of 3 (behaviour of using Conduktor Platform - all topics have the same RF of 3)
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --create --partitions 3 --replication-factor 2
 
# second_topic --create with 5 partitions 
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --create --partitions 5 --replication-factor 1
# WARNING: Due to limitations in metric names, topics with a period ('.') or underscore ('_') could collide. To avoid issues it is best to use either, but not both.
Created topic second_topic.

#list Kafka Topics
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --list
# first_topic
second_topic
third_topic

# get more details about the first topic
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --describe
# Topic: first_topic      TopicId: nkPimOutRKGxGwTXSfM0EQ		PartitionCount: 3       ReplicationFactor: 1    Configs: segment.bytes=1073741824
        Topic: first_topic      Partition: 0    Leader: 1       Replicas: 1     Isr: 1
        Topic: first_topic      Partition: 1    Leader: 1       Replicas: 1     Isr: 1
        Topic: first_topic      Partition: 2    Leader: 1       Replicas: 1     Isr: 1
( Note:  Isr - in sync replicas topic numbers &  Leader: 1       Replicas: 1     Isr: 1 represents the broker ID 1)

# delete a topic
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --delete
# (no output)

# increase the number of partitions of a Kafka topic
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --alter --topic second_topic --partitions 5
# (no output)

# decease the number of partitions of a Kafka topic
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --partitions 4 --alter
# Error while executing topic command : The topic second_topic currently has 5 partition(s); 4 would not be an increase.
#[2024-07-29 18:14:10,007] ERROR org.apache.kafka.common.errors.InvalidPartitionsException: The topic second_topic currently has 5 partition(s); 4 would not be an increase.


