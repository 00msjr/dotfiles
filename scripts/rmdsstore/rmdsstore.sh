# Function to remove .DS_Store files
remove_ds_store() {
  find / -name ".DS_Store" -type f -delete
}

remove_ds_store
