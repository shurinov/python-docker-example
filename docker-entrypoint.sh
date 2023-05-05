#!/usr/bin/env sh

set -e

case "$1" in
    ip)
        exec bash -c "sleep 5s && echo '${HOSTNAME}: ' && curl -s curl -4 icanhazip.com"
        ;;
    ping)
        exec bash -c "ping google.com"
        ;;
    net_inspect)
        exec bash -c "./inspect-net-stack.sh"
        ;;
    one)
        exec python test.py --name one --config_file test_conf.yml
        ;;
    two)
        exec python test.py --name two --config_file test_conf.yml
        ;;
    *)
        exec "$@"
esac