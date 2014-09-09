echo "updating HAproxy config file ..."
ssh haproxy "cp /etc/haproxy/haproxy-2-servers.cfg /etc/haproxy/haproxy.cfg" 

echo "restarting HAproxy..."
ssh haproxy "service haproxy restart"

echo "done."

