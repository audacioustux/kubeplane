FROM jetpackio/devbox:latest

USER root:root

RUN apt-get update -y && \
    apt-get install -y zsh

# Set zsh as default shell
RUN chsh -s "$(which zsh)" ${DEVBOX_USER:?}

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${DEVBOX_USER}:${DEVBOX_USER}

RUN mkdir -p ~/.config/nix && cat <<EOF >> ~/.config/nix/nix.conf
download-buffer-size = 536870912 # 512MB
auto-optimise-store = true
EOF

CMD sleep infinity
