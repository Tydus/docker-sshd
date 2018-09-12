# Docker SSH daemon

# Usage
    docker run -itd --name foo -v $HOME/.ssh/authorized_keys:/authorized_keys:ro tydus/sshd
