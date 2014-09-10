VM_DIR=/home/justin.may/vmware
HAPROXY=$VM_DIR/haproxy/haproxy.vmx 
PUPPETMASTER2=$VM_DIR/puppetmaster2/puppetmaster2.vmx 

VMHOST_2=demo2

revert () {
    echo "Reverting $1:$2 to demo_start snapshot"
    ssh $1 "vmrun revertToSnapshot $2 demo_start"
    
    echo "Starting $1:$2"
    ssh $1 "vmrun start $2 nogui"
}

revert $VMHOST_2 $PUPPETMASTER2 

echo "done."

