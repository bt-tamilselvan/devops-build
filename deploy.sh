#!/bin/bash

echo "Deployment Branch: $BRANCH_NAME"

docker stop my-reactapp-container || true
docker rm my-reactapp-container || true

if [[ "$BRANCH_NAME" == "dev" ]]; then
    docker pull tamilselvanbt/dev-react-image:latest
    docker run -d -p 80:80 --name my-reactapp-container tamilselvanbt/dev-react-image:latest

elif [[ "$BRANCH_NAME" == "main" ]]; then
    docker pull tamilselvanbt/prod-react-image:latest
    docker run -d -p 80:80 --name my-reactapp-container tamilselvanbt/prod-react-image:latest
fi
