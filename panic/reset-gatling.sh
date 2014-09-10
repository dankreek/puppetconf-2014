VM_DIR=/home/justin.may/vmware
GATLING=$VM_DIR/gatling/gatling.vmx 

VMHOST_2=demo2

revert () {
    echo "Reverting $1:$2 to demo_start snapshot"
    ssh $1 "vmrun revertToSnapshot $2 demo_start"
    
    echo "Starting $1:$2"
    ssh $1 "vmrun start $2 nogui"
}

echo "Restoring and restarting all VMs. Ensure the vmware GUI is not open."

revert $VMHOST_2 $GATLING 

echo "done."

