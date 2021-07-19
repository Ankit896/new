#!/bin/bash

echo "Enter first number"
read x
echo "Enter second number"
read y


echo "Select your choice for opperation [1-Add, 2-Sub, 3-Mul or 4-Div ]? "

read choice

if [ $choice -eq 1 ]
then
       
	Add=$(( $x + $y ))

        echo "Sum of $x and $y is: $Add"

fi

if [ $choice -eq 2 ]
then
        Sub=$(( $x - $y ))
        echo "Sum of $x and $y is: $Sub"

fi

if [ $choice -eq 3 ]
then
        Mul=$(( $x * $y ))
        echo "Sum of $x and $y is: $Mul"

fi

if [ $choice -eq 4 ]
then
        Div=$(( $x / $y ))
        echo "Sum of $x and $y is: $Div"

fi


