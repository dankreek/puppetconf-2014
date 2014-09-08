
puts "updating HAproxy config file ..."
ssh root@10.16.132.217 "cp /etc/haproxy/haproxy-2-servers.cfg /etc/haproxy/haproxy.cfg" # TODO put other config file in place

puts "restarting HAproxy..."
ssh root@10.16.132.217 "service haproxy restart"

echo "done."

