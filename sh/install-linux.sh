hash hugo 2>/dev/null || {
  sudo apt-get install hugo && \
  sudo mkdir -p /scratch/waqf/landing/www && sudo chown -R ${USER} /scratch
}
