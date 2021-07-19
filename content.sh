#!/bin/bash

echo "Enter the file name which you want to create"

echo -en '\n' 

read file

touch /tmp/$file.txt

echo "File has been Created Successfully"

echo "Enter the content which you want to add in file"

read content
read content2 
read content3
read content4
read content5
read content6
read content7
read content8
read content9
read content10

echo  "$content
$content2
$content3
$content4
$content5
$content6
$content7
$content8
$content9
$content10
">> /tmp/$file

echo "$content" >> /tmp/$file

#First Operation completed
echo "Press -1 to see top n lines"
echo "Press -2 to see top n lines"
read press

if [ $press -eq 1 ]
then
cat /tmp/$file | head -10
fi

if [ $press -eq 2 ]
then
cat /tmp/$file | tail -10
fi






