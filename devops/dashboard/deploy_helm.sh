#!/bin/bash
set -e

pwd

set -a
source .env
set +a

envsubst < igress.template > igress.yaml

kubectl apply -f ./igress.yaml

#helm upgrade --install $NAME_SPACE ./chart

