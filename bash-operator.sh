#!/bin/bash

echo "Please Type the image version"
read VERSION

echo "Building the image"
docker build  ./redis-operator -t shubham192001/redis-operator:${VERSION}
sleep 1

echo "Pushing the image to docker hub"
docker push shubham192001/redis-operator:${VERSION}

echo "Clean up all resource"
kubectl delete redisclusters.redis.redis.opstreelabs.in --all
kubectl delete redis.redis.redis.opstreelabs.in --all

echo "Uninstall the previous operator"
helm uninstall shubham 

sleep 3
echo "Deploying the Current Operator version ${VERSION}"
helm  install shubham /home/shubham/opsTree/helm-charts/charts/redis-operator --set redisOperator.imageName=shubham192001/redis-operator --set redisOperator.imageTag=${VERSION}

# echo "Update the CRD"
# kubectl apply -f /home/shubham/opsTree/redis-operator/config/crd/bases