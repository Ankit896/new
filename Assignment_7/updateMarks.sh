#!/bin/bash
# Read class 6A file line by line
# Get name from line
# Get roll no from line
#Search on the basis of email
#Search on the basis of roll no
#Search on the basis of name



Class_File="Class6A.csv"
Google_Form="Googleform.csv"

function getwordfromline (){

Line=$1
Word_position=$2
echo ${Line} |  awk -F , -v wp=${Word_position} '{print $wp}'

}

function findstudentbyEmail () {
Roll_No=$1
grep "${Roll_No}@dps.com" ${Google_Form}
}

function findstudentbyRollno () {
Roll_No=$1
grep "${Roll_No}" ${Google_Form}
}

function findstudentbyName () {
Name=$1
grep "${Name}" ${Google_Form}
}

while IFS= read -r line;do
 Name=`getwordfromline "$line" 2`
  #echo "Student Name : ${Name}"
 Roll_No=`getwordfromline "$line" 1`
  #echo "Student Roll No : ${Roll_No}"

  Student_Record=`findstudentbyEmail ${Roll_No}`
  if [ "${Student_Record}" == "" ];then
    echo "Student details are not found, I will search on the basis of roll no"
else
    echo "Student Record found on the basis of email ${Student_Record}"
    Student_Record=`findstudentbyRollno ${Roll_No}`
      if [ "${Student_Record}" == "" ];then
        echo "Student details are not found, I will search on the basis of roll no"
    else
        echo "Student Record found on the basis of roll no ${Student_Record}"
    
    Student_Record=`findstudentbyName ${Name}`
        if [ "${Student_Record}" == "" ];then
            echo "Student details are not found, I will search on the basis of name"
        else
            echo "Student Record found on the basis of name ${Student_Record}"
        fi
    fi
fi
done < "${Class_File}"