#!/bin/bash



echo '  - path: "/etc/iproute2/rt_tables"
    permissions: "0644"
    owner: "root"
    content: |'      
grep rt_tables $1 | awk -F':' '{ print "      " $2 }'
echo ''
for i in $(seq 1 7) 
do
   if [ "$(grep route-eth$i $1 | awk -F':' '{ print "       " $2 }' | wc -l)" -ne 0 ]
    then 
    echo "  - path: \"/etc/sysconfig/network-scripts/route-eth$i\"
    permissions: \"0644\"
    owner: \"root\"
    content: |"
    grep route-eth$i $1 | awk -F':' '{ print "      " $2 }'
    echo ''
   fi
done
for i in $(seq 1 7)
do
    if [ "$(grep rule-eth$i $1 | awk -F':' '{ print "       " $2 }' | wc -l)" -ne 0 ]
     then
     echo "  - path: \"/etc/sysconfig/network-scripts/rule-eth$i\"
    permissions: \"0644\"
    owner: \"root\"
    content: |"
     grep rule-eth$i $1 | awk -F':' '{ print "      " $2 }'
     echo ''
    fi
done
echo '  - path: "/etc/hosts"
    permissions: "0644"
    owner: "root"
    content: |'
grep rt_tables $1 | awk -F':' '{ print "      " $2 }'
