#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
    then 
    echo Please provide an element as an argument.
    else
    if [[ $1 =~ ^[0-9]+$ ]]
        then
        RETURN_RESULT=$($PSQL "Select e.atomic_number,e.name,e.symbol,p.type,p.atomic_mass,
                              p.melting_point_celsius,p.boiling_point_celsius 
                              From elements e Join properties p on p.atomic_number=e.atomic_number
                              Where e.atomic_number=$1");
        echo $RETURN_RESULT
        elif [[ ${#1} -le 2 ]]
          then
          RETURN_RESULT=$($PSQL "Select e.atomic_number,e.name,e.symbol,p.type,p.atomic_mass,
                              p.melting_point_celsius,p.boiling_point_celsius 
                              From elements e Join properties p on p.atomic_number=e.atomic_number
                              Where e.symbol='$1'");
        echo $RETURN_RESULT
        else
        RETURN_RESULT=$($PSQL "Select e.atomic_number,e.name,e.symbol,p.type,p.atomic_mass,
                              p.melting_point_celsius,p.boiling_point_celsius 
                              From elements e Join properties p on p.atomic_number=e.atomic_number
                              Where e.name='$1'");
        echo $RETURN_RESULT
        fi                      
    fi