#!/usr/bin/bash
echo "First way of getting the IP"
ip route get 8.8.8.8 | awk '{print $7}'


echo "second way of getting the ip"
# Get the interfaces  names, allways after the interface name there is : and flags 
interfaces=$(ifconfig | grep "flags" |cut -d : -f 1)

#echo $interfaces 


# Loop through each interface
for iface in $interfaces; do
    # urn ifconfig on the interface, and grep the ip, it always came after inet 
    ip=$(ifconfig $iface | grep 'inet ' | awk '{print $2}')
    # Check if we can ping Google from this interface
    # redirt the errors to /dev/null 
    if ping -c 1 -I $iface 8.8.8.8 &> /dev/null; then
        echo "Interface: $iface"
        echo "IP Address: $ip"
        exit 0
    fi
done

