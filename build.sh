#!/bin/bash

echo "Current Branch: $BRANCH_NAME"

if [ "$BRANCH_NAME" == "dev" ]; then
    docker build -t tamilselvanbt/dev-react-image .
    echo "Tamilselva03." | docker login -u "tamilselvanbt" --password-stdin
    docker push tamilselvanbt/dev-react-image:latest

elif [ "$BRANCH_NAME" == "main" ]; then
    docker build -t tamilselvanbt/prod-react-image .
    echo "Tamilselva03." | docker login -u "tamilselvanbt" --password-stdin
    docker push tamilselvanbt/prod-react-image:latest
fi
