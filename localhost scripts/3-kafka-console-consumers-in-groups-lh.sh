############################
#####     LOCALHOST    #####
############################

# create a topic with 3 partitions
kafka-topics.sh --bootstrap-server localhost:9092 --topic x_topic --create --partitions 3 --replication-factor 1

# start one producer and start producing
kafka-console-producer.sh --bootstrap-server localhost:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic x_topic


# start first consumer
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic x_topic --group AAA
first
fourth
seventh
tenth

# start second consumer part of the same group. See messages being spread
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic x_topic --group AAA
second
fifth
eight

# start third consumer part of the same group. See messages being spread
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic x_topic --group AAA
third
sixth
nineth

# close all three keep producing msgs 
# start new consumer part of a different group from beginning
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic x_topic --group AAA--from-beginning
hh
ii
jj
kk
~~~~~~ note ~~~~~~~~~~
# Upon restart of a consumer in the group, the consumer will read from the latest committed offsets 
# and read only the messages you've just produced
# If you consume in a consumer groups using the --group command, then if you try using the 
# --from-beginning option afterwards with the same group, it will be ignored.
# If you don't specify a --group option, the consumer group of the consumer will be a random consumer group such as console-consumer-11984
<Upon restart of a consumer in the group, the consumer will read from the latest committed offsets and read only the messages you have just produced>