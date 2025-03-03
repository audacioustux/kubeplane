: ${WORKSPACE_FOLDER:?}

. <(devbox shellenv -c $WORKSPACE_FOLDER --init-hook --install)

: ${DEVBOX_PROJECT_ROOT:?}

export PROFILE_ROOT="$DEVBOX_PROJECT_ROOT/.devbox/nix/profile/default"
