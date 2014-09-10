shutdown () {
    echo "Shutting down $1"
    ssh root@$1 "shutdown now"
}

echo "Shutting down all hosts."

shutdown grafana
shutdown puppetmaster1
shutdown puppetmaster2
shutdown haproxy
shutdown gatling

echo "done."

