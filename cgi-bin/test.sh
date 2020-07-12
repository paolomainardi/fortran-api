#!/bin/bash


echo "Content-type: application/json"
echo ""

## Extract query strings.
saveIFS=$IFS
IFS='=&'
parm=($QUERY_STRING)
IFS=$saveIFS
for ((i=0; i<${#parm[@]}; i+=2))
do
    declare var_${parm[i]}=${parm[i+1]}
done

# Run the command.
echo "${var_a},${var_b},${var_c}" | /fortran/sum | awk '{ print $8 }'
exit 0
