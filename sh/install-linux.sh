hash hugo 2>/dev/null || { pushd . >/dev/null && cd /tmp && \
  wget https://github.com/gohugoio/hugo/releases/download/v0.37.1/hugo_0.37.1_Linux-64bit.deb;
  sudo dpkg -i hugo_*.deb;
  popd >/dev/null;
  sudo mkdir -p /scratch/waqf/landing/www && sudo chown -R ${USER} /scratch
}
