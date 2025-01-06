#!/bin/bash

# Danh sách các file .tar và tên images tương ứng
declare -A tar_files_images=(
  ["sysreptor-app_customized.tar"]="sysreptor-app:customized"
  ["sysreptor-caddy_customized.tar"]="sysreptor-caddy:customized"
  ["sysreptor-redis_customized.tar"]="sysreptor-redis:customized"
  ["sysreptor-db_customized.tar"]="sysreptor-db:customized"
)

# Import từng image từ file .tar
for tar_file in "${!tar_files_images[@]}"; do
  image="${tar_files_images[$tar_file]}"
  echo "Loading image from $tar_file..."
  docker load -i "$tar_file"
  echo "Image $image has been loaded."
done

echo "All images have been loaded successfully."

# Khởi động containers bằng docker-compose
echo "Starting containers using docker-compose..."
docker-compose up -d

echo "All images have been loaded and containers have been started."
