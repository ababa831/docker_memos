#!/usr/bin/env bash

image=ababa831/kaggle-custom:latest

docker build -t ${image} .
docker push ${image}