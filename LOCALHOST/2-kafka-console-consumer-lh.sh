############################
#####     LOCALHOST    #####
############################


# consuming all historical messages and future ones in a Kafka
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic --from-beginning
# as we publish all messages into first_topic in previous chapter
exampleValue
Hello
Aashrita here
love you
Just specify that every messageshould be acks by all brokers.
this is ack-ed by all brokers
funnn
aashrita
^CProcessed a total of 8 messages

# Consuming only the future messages of a Kafka topic
# send some msgs - old , run consume cmd and send some new msgs in two different terminals
# Producer Terminal
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-producer.sh --bootstrap-server localhost:9092 --topic second_topic
>oldmsg
>newsg
>hi consumer
>i am producer
>bye
>^C

# Consumer terminal
# It assumes all the messages coming in can be deserialized as text (String).
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic
newsg
hi consumer
i am producer
bye
^CProcessed a total of 4 messages

# By default, the Kafka Console Consumer does not show the key, or any partition information.
# Producer Terminal with K:V pair msgs
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-producer.sh --bootstrap-server localhost:9092 --topic second_topic --property parse.key=true --prope
rty key.separator=:
>country:india
>city:hubli
>empID:56165

# Consumer Terminal with values only
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic
india
hubli
56165
^CProcessed a total of 3 messages

~~~~Important note on message ordering~~~~~~
#The order of messages is not total, it is per partition. As a topic may be created with more than one partition, t
#he order is only guaranteed at the partition level. 
#If you try with only one partition, you will see total ordering.
#If the topic does not exist, the console consumer will automatically create it with default
# You can consume multiple topics at a time with a comma-delimited list or a pattern.
# If a consumer group id is not specified, the kafka-console-consumer generates a random consumer group.


# Produce after editting properties using --formatter command
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-producer.sh --bootstrap-server localhost:9092 --topic second_topic --property parse.key=true --property key.separator=:
>welcome:again
>displaykey:displayvalue

# display key, values and timestamp in consumer from second_topic(5partitions) and hence the order is not correct
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic --formatter 
    kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true 
    --property print.value=true --property print.partition=true --from-beginning
CreateTime:1722261523754        city    hubli
CreateTime:1722261540845        empID   56165
CreateTime:1722261507614        country india
CreateTime:1722261231614        null    oldmsg
CreateTime:1722261242378        null    newsg
CreateTime:1722261250724        null    hi consumer
CreateTime:1722261256644        null    i am producer
CreateTime:1722261265806        null    bye
CreateTime:1722262244712        welcome again
CreateTime:1722262258618        displaykey      displayvalue
^CProcessed a total of 10 messages

# Produce terminal : second_topic has 5 partitions hence P0 receives 1st,6th & 11th msg only for RR msg distribution into partitions
kafka-console-producer.sh --bootstrap-server localhost:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic second_topic
>one
>two
>three
>four
>five
>six
>^C

# Consumer Terminal consuming from PO only
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic --partition=0
one
six
^CProcessed a total of 2 messages

# Consumer terminal message deatils for RR msg distribution
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true  --from-beginning
CreateTime:1722263080859        Partition:1     null    three
CreateTime:1722263075287        Partition:0     null    one
CreateTime:1722263085786        Partition:0     null    six
CreateTime:1722263082424        Partition:3     null    four
CreateTime:1722263077749        Partition:2     null    two
CreateTime:1722263083969        Partition:4     null    five
