Linux Virtual Machine

username : aashritakafka
password : aashrita0909

ctrl + X - EXIT
ctrl + C - Cancel/End

clear screen 
aashritakafka@DESKTOP-U2SQV3E:~$ clear

move up two levels of directory - WPS
cd ../../

Ubunto move one folder up 
 cd \..
 
view files in the directory 
aashritakafka@DESKTOP-U2SQV3E:~$ ls

web dir link https://archive.apache.org/dist/kafka/3.7.1/

wget https://archive.apache.org/dist/kafka/3.7.1/kafka_2.13-3.7.1.tgz

/home/aashriakafka/kafka_2.13-3.7.1

PATH="$PATH:~/kafka_2.13-3.7.1/bin"

#move in 
aashritakafka@DESKTOP-U2SQV3E:~$ cd kafka_2.13-3.7.1

# cmd to start zookeeper
aashritakafka@DESKTOP-U2SQV3E:~$ zookeeper-server-start.sh ~/kafka_2.13-3.7.1/config/zookeeper.properties

#cmd to start kafka 
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-server-start.sh ~/kafka_2.13-3.7.1/config/server.properties

# nano cmd to edit file ctrlX & Y to save
aashritakafka@DESKTOP-U2SQV3E:~$ nano kafka_2.13-3.7.1/config/zookeeper.properties
aashritakafka@DESKTOP-U2SQV3E:~$ nano kafka_2.13-3.7.1/config/server.properties

#set localhost port
aashritakafka@DESKTOP-U2SQV3E:~/kafka_2.13-3.7.1$ nano config/server.properties
ctrl + X and enter Y
listeners=PLAINTEXT://:9092

#to read file - cross check listeners port setting changes 
aashritakafka@DESKTOP-U2SQV3E:~/kafka_2.13-3.7.1$ cat config/server.properties

#Generate a cluster ID and format the storage 
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-storage.sh random-uuid 
> first 6xtO9JhZScKMmKUhjWzPtw  , second - B7JPkzCLRmmA62pqg0SBMQ
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-storage.sh format -t 6xtO9JhZScKMmKUhjWzPtw -c ~/kafka_2.13-3.7.1/config/kraft/server.properties
success in formatting # A comma separated list of directories under which to store log files
log.dirs=/tmp/kraft-combined-logs

# start kafka without zookeeper -> KRAFT MODE
aashritakafka@DESKTOP-U2SQV3E:~$ kafka-server-start.sh ~/kafka_2.13-3.7.1/config/kraft/server.properties

# edit server defaults
aashritakafka@DESKTOP-U2SQV3E:~$ nano kafka_2.13-3.7.1/config/kraft/server.properties
