#!/bin/bash

cd ./dockerimage
docker build -t 'chamilo' .
cd ..
docker-compose up -d

echo ""
echo "Chamilio on Docker successfully set up"
echo ""
