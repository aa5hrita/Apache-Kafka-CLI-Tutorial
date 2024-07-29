~~~~~~~~~~~KAFKA Console Producer CLI~~~~~~~~~~~

################################################
###############     LOCALHOST    ###############
################################################

kafka-console-producer.sh

# produce 3 messages into the topic
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-producer.sh --bootstrap-server localhost:9092 --topic first_topic
>Hello
>Aashrita here
>love you
>^C  (<- Ctrl + C is used to exit the producer)

#Produce a Message into a Kafka Topic with Properties
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-producer.sh --bootstrap-server localhost:9092 --topic first_topic --producer-property acks=all
>Just specify that every message should be acks by all brokers
>this is ack-ed by all brokers
>funnn
>^C

# Produce a Message into a non existing Kafka topic
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-producer.sh --bootstrap-server localhost:9092 --topic new_topic
>ayyyyayyy
[2024-07-29 18:32:44,274] WARN [Producer clientId=console-producer] Error while fetching metadata with correlation id 5 : {new_topic=UNKNOWN_TOPIC_OR_PARTITION} (org.apache.kafka.clients.NetworkClient)
>pool
>^C
# If the topic does not exist, it can be auto-created by Kafka  with the default number of partitions and replication factor. 
# These are controlled by the broker-side settings (in your config/server.properties file)

# verify new toopic created in the above step
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --list
first_topic
new_topic
second_topic
third_topic

# know what are the default values for Partition & Replicas
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-topics.sh --bootstrap-server localhost:9092 --topic new_topic --describe
Topic: new_topic        TopicId: LfR94hLCStiXkdYU-U-VUg PartitionCount: 1       ReplicationFactor: 1    Configs: segment.bytes=1073741824
Topic: new_topic        Partition: 0    Leader: 1       Replicas: 1     Isr: 1

# if topic auto creation is disabled (by default on playground), then the topic will not appear in the list

# edit config/server.properties or config/kraft/server.properties
# num.partitions=3

# produce against a non existing topic again
# this time our topic has 3 partitions
kafka-topics.sh --bootstrap-server localhost:9092 --list
kafka-topics.sh --bootstrap-server localhost:9092 --topic new_topic_2 --describe

# overall, please create topics with the appropriate number of partitions before producing to them!

# produce with keys (Key:Value pair as messages, the separator is colon ":")
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic first_topic --property parse.key=true --property key.separator=:
>example key:example value
>name:Stephane
>bye
# reads two msgs and throws exception org.apache.kafka.common.KafkaException: No key separator found on line number 3: 'bye'

