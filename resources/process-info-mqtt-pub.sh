echo "<payload>" > message.txt
echo "<hostname>`hostname`</hostname>" >> message.txt
echo "<type>MEMORY_INFO</type>" >> message.txt
echo "<message><![CDATA[" >> message.txt
cat /proc/meminfo >> message.txt
echo "]]></message>" >> message.txt
echo "</payload>" >> message.txt
mosquitto_pub -L mqtt://semaphore@192.168.1.171/testTopic -f message.txt
rm message.txt

echo "<payload>" > message.txt
echo "<hostname>`hostname`</hostname>" >> message.txt
echo "<type>CPU_INFO</type>" >> message.txt
echo "<message><![CDATA[" >> message.txt
mpstat -P ALL >> message.txt
echo "]]></message>" >> message.txt
echo "</payload>" >> message.txt
mosquitto_pub -L mqtt://semaphore@192.168.1.171/testTopic -f message.txt
rm message.txt

echo "<payload>" > message.txt
echo "<hostname>`hostname`</hostname>" >> message.txt
echo "<type>PROCESS_INFO</type>" >> message.txt
echo "<message><![CDATA[" >> message.txt
ps aux >> message.txt
echo "]]></message>" >> message.txt
echo "</payload>" >> message.txt
mosquitto_pub -L mqtt://semaphore@192.168.1.171/testTopic -f message.txt
rm message.txt
