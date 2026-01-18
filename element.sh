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
        echo $RETURN_RESULT|while IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
        do 
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done 
        elif [[ ${#1} -le 2 ]]
          then
          RETURN_RESULT=$($PSQL "Select e.atomic_number,e.name,e.symbol,p.type,p.atomic_mass,
                              p.melting_point_celsius,p.boiling_point_celsius 
                              From elements e Join properties p on p.atomic_number=e.atomic_number
                              Where e.symbol='$1'");
        echo $RETURN_RESULT|while IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
        do 
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done 
        else
        RETURN_RESULT=$($PSQL "Select e.atomic_number,e.name,e.symbol,p.type,p.atomic_mass,
                              p.melting_point_celsius,p.boiling_point_celsius 
                              From elements e Join properties p on p.atomic_number=e.atomic_number
                              Where e.name='$1'");
        echo $RETURN_RESULT|while IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
        do 
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done 
        fi                      
    fi