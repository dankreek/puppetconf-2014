echo "restoring master 1 VM to snapshot..."
ssh justin.may@puppetconf-demo1.platform.eng.puppetlabs.net "vmrun revertToSnapshot ./vmware/puppetserver/puppetserver.vmx \"master process running\""

echo "starting master 1 VM..."
ssh justin.may@puppetconf-demo1.platform.eng.puppetlabs.net "vmrun start ./vmware/puppetserver/puppetserver.vmx nogui"

echo "restoring master 2 VM to snapshot..."
ssh justin.may@puppetconf-demo2.platform.eng.puppetlabs.net "vmrun revertToSnapshot ./vmware/puppetmaster2/puppetmaster2.vmx \"master process running\""

echo "starting master 2 VM..."
ssh justin.may@puppetconf-demo2.platform.eng.puppetlabs.net "vmrun start ./vmware/puppetmaster2/puppetmaster2.vmx nogui"


# TODO any sort of automation around gatling?

# TODO any sort of automation around haproxy?

# TODO any sort of automation around grafana?
