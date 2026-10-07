#!/bin/bash
# Simple ifs

int1=10
int2=5
int3=20
int4=15
str1=Smol
str2="This is a longer string"
echo $int1
echo $int2
echo $int3
echo $int4
echo $str1
echo $str2
echo

if [[ int1 -eq int2 ]]
then
    echo int1 is equal to int2
fi

if [[ int2 -lt int3 ]]
then
    echo int2 is smaller than int3
fi

if [[ str1 = str1 ]]
then
    echo str1 is $str1
fi

if [[ str2 != str1 ]]
then    
    echo str2 is longer than str1
fi

if [[ -z str1 ]]
then
    echo str1 is empty
else
    echo str1 has content
    if [[ -n str2 ]]
    then
    echo nested alos works
    fi
fi