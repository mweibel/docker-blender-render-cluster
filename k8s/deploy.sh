#!/bin/bash
#
# Deploying blender render cluster on a kubernetes cluster
#

if [[ -z "${DOMAIN}" ]]; then
    echo "Please set DOMAIN env variable when calling this file"
    exit 1
fi

DIR=`dirname $0`

kubectl apply -f $DIR/namespace.yml
kubectl apply -f $DIR/services.yml
kubectl apply -f $DIR/statefulSet.yml
kubectl apply -f $DIR/secret.yml

cat $DIR/ingress.yml | sed 's/blender-cluster.example.com/'${DOMAIN}'/g'| kubectl apply -f -