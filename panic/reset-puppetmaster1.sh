VM_DIR=/home/justin.may/vmware
PUPPETMASTER1=$VM_DIR/puppetserver/puppetserver.vmx 

VMHOST_1=demo1

revert () {
    echo "Reverting $1:$2 to demo_start snapshot"
    ssh $1 "vmrun revertToSnapshot $2 demo_start"
    
    echo "Starting $1:$2"
    ssh $1 "vmrun start $2 nogui"
}

revert $VMHOST_1 $PUPPETMASTER1 

echo "done."

