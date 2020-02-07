#!/bin/bash

#usage: ./run_script.sh <database_name> <schema_name> <owner_name>

sed -e "s/<SCHEMA>/$2/g" -e "s/<OWNER>/$3/g" account_db_structure.template > account_db_structure.sql 

echo "SQL File created, would you like to run now? <y/n>"

read run

if [ $run == "y" ]; then
    psql -d $1 -f account_db_structure.sql
fi

echo "Would you like to save the created sql file? <y/n>"

read save

if [ $save == "n" ]; then
    rm -rf account_db_structure.sql
fi 