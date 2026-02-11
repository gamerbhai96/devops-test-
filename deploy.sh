#!/bin/bash

# Navigate to the deployment directory
cd /home/ubuntu

# Pull the latest code
git clone https://github.com/gamerbhai96/devops-test-.git app || (cd app && git pull origin main)

# Build and run the Docker container
cd app
docker build -t my-app .
docker stop my-app-container || true
docker rm my-app-container || true
docker run -d --name my-app-container -p 80:80 my-app

echo "Deployment completed successfully!"
