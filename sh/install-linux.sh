#!/bin/bash
hash hugo 2>/dev/null || { pushd . >/dev/null && cd /tmp && \
  wget https://github.com/gohugoio/hugo/releases/download/v0.53/hugo_0.53_Linux-64bit.deb;
  sudo dpkg -i hugo_*.deb;
  popd >/dev/null;
  sudo mkdir -p /scratch/waqf/landing/www && sudo chown -R ${USER} /scratch
}
