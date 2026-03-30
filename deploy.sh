#!/bin/bash
source .env
echo "Deploying to production..."
ssh $SSH_USER@$DB_HOST "cd /opt/app && docker-compose pull && docker-compose up -d"
echo "Restarting nginx..."
ssh $SSH_USER@$DB_HOST "sudo systemctl restart nginx"
echo "Done."
