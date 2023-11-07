#!/bin/bash

v1weight=100

echo "input v1 routing weight (0-100): "
read v1weight

helm upgrade --install blue-green-deployment ./ --set reviews.v1.weight=$v1weight