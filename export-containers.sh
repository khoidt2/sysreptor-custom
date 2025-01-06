#!/bin/bash

# Danh sách các containers và tên images tương ứng
declare -A containers_images=(
  ["sysreptor-app"]="sysreptor-app:customized"
  ["sysreptor-caddy"]="sysreptor-caddy:customized"
  ["sysreptor-redis"]="sysreptor-redis:customized"
  ["sysreptor-db"]="sysreptor-db:customized"
)

# Export từng container thành image và lưu vào file .tar
for container in "${!containers_images[@]}"; do
  image="${containers_images[$container]}"
  echo "Committing container $container to image $image..."
  docker commit "$container" "$image"

  tar_file="${image%%:*}_customized.tar"
  echo "Saving image $image to $tar_file..."
  docker save -o "$tar_file" "$image"
done

echo "All images have been saved as .tar files."
