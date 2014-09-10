VM_DIR=/home/justin.may/vmware
HAPROXY=$VM_DIR/haproxy/haproxy.vmx 

VMHOST_1=demo1

revert () {
    echo "Reverting $1:$2 to demo_start snapshot"
    ssh $1 "vmrun revertToSnapshot $2 demo_start"
    
    echo "Starting $1:$2"
    ssh $1 "vmrun start $2 nogui"
}

echo "Restoring and restarting all VMs. Ensure the vmware GUI is not open."

revert $VMHOST_1 $HAPROXY 

echo "done."

