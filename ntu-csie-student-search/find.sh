#!/bin/bash

input=$1

if [[ $input =~ ^[a-zA-Z][0-9]+$ ]]; then
    surname=`ldapsearch -x uid=$input | grep -E "sn" | grep -oE "[^ ]*$" | base64 -d`
    givenName=`ldapsearch -x uid=$input | grep -E "givenName" | grep -oE "[^ ]*$" | base64 -d`
    
    if [[ -z "$surname" && -z "$givenName" ]]; then
        echo "No results found for Student ID: $input"
    else
        echo "$input $surname$givenName"
    fi
else
    studentIDs=`ldapsearch -x "givenName=$input" uid | grep "^uid:" | cut -d ' ' -f2-`
    
    if [[ -z "$studentIDs" ]]; then
        echo "No results found for name: $input"
    else
        echo "$studentIDs" | while read -r studentID; do
            surname=`ldapsearch -x uid=$studentID | grep -E "sn" | grep -oE "[^ ]*$" | base64 -d`
            givenName=`ldapsearch -x uid=$studentID | grep -E "givenName" | grep -oE "[^ ]*$" | base64 -d`
            
            echo "$studentID $surname$givenName"
        done
    fi
fi
