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
}

echo "Restoring and restarting all VMs. Ensure the vmware GUI is not open."

revert $VMHOST_1 $PUPPETMASTER1 
revert $VMHOST_2 $PUPPETMASTER2 
revert $VMHOST_1 $GRAFANA 
revert $VMHOST_1 $HAPROXY 
revert $VMHOST_2 $GATLING 

echo "done."

