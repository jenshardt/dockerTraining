#!/bin/sh
NAMESPACE=seminar
REPOSITORY=ctr-exercise-rest

docker build -t $NAMESPACE/$REPOSITORY $@ .