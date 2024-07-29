############################
#####     LOCALHOST    #####
############################

# look at the documentation again
kafka-consumer-groups.sh

# describe the consumer group
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application

<You cannot reset a consumer group if consumers are active in it>
<The CURRENT-OFFSET is the latest committed offset for that group>
<The LOG-END-OFFSET represents the latest message offset available in the topic-partition for consumption>

# Dry Run: reset the offsets to the beginning of each partition
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group my-first-application --reset-offsets --to-earliest --topic third_topic --dry-run

# execute flag is needed
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group my-first-application --reset-offsets --to-earliest --topic third_topic --execute

# describe the consumer group again
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application

# consume from where the offsets have been reset
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic third_topic --group my-first-application

# describe the group again
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application

#Listing consumer groups state
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list --state
GROUP                STATE
AAA                  Empty
my-first-application Empty
myConsumerApp        Empty

#Describe all consumer groups and state 
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --all-groups  --state

#Deletion requested for a consumer group
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete --group my-first-application
Deletion of requested consumer groups ('my-first-application') was successful.

# delete offsets for a specific topic (helpful when your consumer group is reading from multiple topics) you can use the following command:>
# Perform operations on the consumer offsets using kafka-consumer-groups
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --delete-offsets --group my-first-application --topic first_topic
<reads from first msg next time when a consumer is started>
<to reset - the consumers must be stopped>
