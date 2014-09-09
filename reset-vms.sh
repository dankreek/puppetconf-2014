VM_DIR=/home/justin.may/vmware
HAPROXY=$VM_DIR/haproxy/haproxy.vmx 
PUPPETMASTER1=$VM_DIR/puppetserver/puppetserver.vmx 
PUPPETMASTER2=$VM_DIR/puppetmaster2/puppetmaster2.vmx 
GATLING=$VM_DIR/gatling/gatling.vmx 
GRAFANA=$VM_DIR/grafana/grafana.vmx 

VMHOST_1=demo1
VMHOST_2=demo2

revert () {
    echo "Reverting $1:$2 to demo_start snapshot"
    ssh $1 "vmrun revertToSnapshot $2 demo_start"
    
    echo "Starting $1:$2"
    ssh $1 "vmrun start $2 nogui"

    echo "Rebooting $3"
    ssh $3 "reboot"
}

echo "Restoring and restarting all VMs. Ensure the vmware console is closed on each system."

revert $VMHOST_1 $PUPPETMASTER1 puppetmaster1
revert $VMHOST_2 $PUPPETMASTER2 puppetmaster2
revert $VMHOST_1 $HAPROXY haproxy
revert $VMHOST_2 $GATLING gatling
revert $VMHOST_1 $GRAFANA grafana

echo "Starting Puppet masters"
"$(dirname "$0")/start-masters.sh"

echo "done."

