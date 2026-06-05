#!/bin/bash
# Using let

num1=1
echo $num1
num2=2
echo $num2
num3=3
echo $num3
num4=4
echo $num4
num5=5
echo $num5
num6=6
echo $num6
echo

let num1++
echo $num1
let num2=num2-1
echo $num2
let num0=num6*num5
echo $num0

let num1+=10
echo $num1
let num2-=15
echo $num2
echo
echo $num3
let num3++
echo $num3
let num3++
echo $num3
let num3++
echo $num3
let num3++
echo $num3