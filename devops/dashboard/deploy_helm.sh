#!/bin/bash
set -e

pwd

source .env

envsubst < igress.template > igress.yaml

kubectl apply -f ./igress.yaml

#helm upgrade --install $NAME_SPACE ./chart

