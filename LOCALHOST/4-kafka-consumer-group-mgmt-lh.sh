############################
#####     LOCALHOST    #####
############################

# documentation for the command 
kafka-consumer-groups.sh 

# list consumer groups
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
AAA
my-first-application
myConsumerApp
 
# describe one specific consumer group
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application

Consumer group 'my-first-application' has no active members.

GROUP                TOPIC           PARTITION  CURRENT-OFFSET  LOG-END-OFFSET  LAG             CONSUMER-ID     HOST            CLIENT-ID
my-first-application second_topic    3          67              67              0               -               -               -
my-first-application second_topic    0          24              24              0               -               -               -
my-first-application second_topic    2          2               2               0               -               -               -
my-first-application second_topic    1          3               3               0               -               -               -
my-first-application second_topic    4          9               9               0               -               -               -
#if there are msgs produced but not consumed and commmiteed then  LOG-END-OFFset value will read
# a higher value and the LAG will be the difference of CURR-OFFSET and LOG-END-OFFSET

# start 2 consumers in 2 windows - MFA: C1 - reading P0&P1 and C2 reading P2
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic --group my-first-application
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic --group my-first-application

# describe the group now to see different consumers reading different partitions of same topic
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application

# start a console consumer - AK puts it in default CGroup
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic --group my-first-application

# list to know available consumers in default group describe a console consumer group (change the end number)
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group console-consumer-10592

# describe the group again
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group my-first-application