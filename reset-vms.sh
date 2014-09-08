
# master 1

echo "restoring master 1 VM to snapshot..."
ssh justin.may@puppetconf-demo1.platform.eng.puppetlabs.net "vmrun revertToSnapshot ./vmware/puppetserver/puppetserver.vmx \"master process running\""

echo "starting master 1 VM..."
ssh justin.may@puppetconf-demo1.platform.eng.puppetlabs.net "vmrun start ./vmware/puppetserver/puppetserver.vmx nogui"

# master 2

echo "restoring master 2 VM to snapshot..."
ssh justin.may@puppetconf-demo2.platform.eng.puppetlabs.net "vmrun revertToSnapshot ./vmware/puppetmaster2/puppetmaster2.vmx \"master process running\""

echo "starting master 2 VM..."
ssh justin.may@puppetconf-demo2.platform.eng.puppetlabs.net "vmrun start ./vmware/puppetmaster2/puppetmaster2.vmx nogui"

# gatling 

echo "restoring gatling VM to snapshot..."
ssh root@10.16.132.218 "vmrun revertToSnapshot ./vmware/puppetmaster2/puppetmaster2.vmx \"master process running\"" # TODO update VM file and snapshot ID

echo "starting gatling VM..."
ssh root@10.16.132.218 "vmrun start ./vmware/puppetmaster2/puppetmaster2.vmx nogui" # TODO update VM file

# haproxy

echo "restoring haproxy VM to snapshot..."
ssh root@10.16.132.217 "vmrun revertToSnapshot ./vmware/puppetmaster2/puppetmaster2.vmx \"master process running\"" # TODO update VM
 file and snapshot ID

echo "starting haproxy VM..."
ssh root@10.16.132.217 "vmrun start ./vmware/puppetmaster2/puppetmaster2.vmx nogui" # TODO update VM file

# TODO do we want to do anything with grafana?

echo "done."

