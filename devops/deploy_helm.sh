#!/bin/bash
set -e

set -a && source .env.phu && set +a

envsubst < igress.template > igress.yaml

kubectl apply -f ./igress.yaml

