#!/bin/sh

cd ~/cryptomessaging/website
rm -rf public; hugo
aws s3 rm s3://cryptomessaging.org --recursive  --profile mobido
aws s3 cp ~/cryptomessaging/website/public s3://cryptomessaging.org/ --recursive --profile mobido

echo "Deployed!"