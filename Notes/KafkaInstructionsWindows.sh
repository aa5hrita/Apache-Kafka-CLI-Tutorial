Windows WSL2 - Extra Instructions
IMPORTANT: If you are using Kafka on Windows WSL2


When running a command from the CLI outside of WSL2 or your Java programs, you may get the following error:

connection to node failed etc etc...


#ERROR

If do you get that error, please run the instructions below
(this is to edge a WSL2 networking bug (https://github.com/microsoft/WSL/issues/4851) with Kafka, so we have to disable IPv6 on WSL2 to remediate)

First, stop Kafka and Zookeeper.

Then, please run these commands on your end on WSL2, one by one.

Your password will be prompted on the first command.

sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1

and

sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

and then, go to config/server.properties and edit the file to add the line:
listeners=PLAINTEXT://localhost:9092
aashritakafka@DESKTOP-U2SQV3E:~$ nano kafka_2.13-3.7.1/config/server.properties

When the three commands have succeeded, relaunch Zookeeper and Kafka. 
You should be able to connect from your Java programs or CLI without a problem!


In case the fix above does not help, Try the fixes outlined in these pages:

https://docs.conduktor.io/kafka-cluster-connection/setting-up-a-connection-to-kafka/connecting-to-kafka-running-on-windows-wsl-2

https://stackoverflow.com/questions/64177422/unable-to-produce-to-kafka-topic-that-is-running-on-wsl-2-from-windows



If after using these fixes, you still cant connect to Kafka, we recommend either
Running Kafka on Windows non-WSL2 (next lecture)

Running Kafka online using Conduktor

