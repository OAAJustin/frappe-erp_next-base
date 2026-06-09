#!/bin/bash
# 1. Initialize variables from .env
source .env

# 2. Pull the latest Docker images
sudo docker compose pull

# 3. Launch the containers
sudo docker compose up -d

# 4. Wait for Database and build the site
sleep 25
sudo docker compose exec backend bench new-site ${SITE_NAME} \
  --admin-password ${ADMIN_PASSWORD} \
  --db-root-password ${DB_PASSWORD} \
  --db-host db \
  --install-app erpnext --force 
