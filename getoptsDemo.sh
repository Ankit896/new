#!/bin/bash

while getopts ":a:bc:" flag;do
    echo "flag -$flag, Argument $OPTARG";
done

