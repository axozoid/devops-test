#!/bin/bash

ENDPOINT=$1

SLEEP_TIME=5
CODE_LOW=200
CODE_HIGH=399

function alert() {
    echo "Host '${1}' is down!"
    # replace the above with smth more practical
}

echo "Start probing ${ENDPOINT}.. [ hit CTRL+C to stop]"

while :
do
    CODE=$(curl -s -o /dev/null -I -w "%{http_code}" ${ENDPOINT})
    if [ ${CODE} -ge ${CODE_LOW} ] && [ ${CODE} -lt ${CODE_HIGH} ]; then
        echo "host is up"
    else
        alert ${ENDPOINT}
    fi
    sleep ${SLEEP_TIME}
done