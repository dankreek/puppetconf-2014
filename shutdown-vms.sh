shutdown () {
    echo "Shutting down $1"
    ssh root@$1 "init 0"
}

echo "Shutting down all hosts."

shutdown grafana & \
shutdown puppetmaster1 & \
shutdown puppetmaster2 & \
shutdown haproxy & \
shutdown gatling & \

echo "done."

