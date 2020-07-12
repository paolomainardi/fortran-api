#!/bin/bash


echo "Content-type: text/html"
echo ""
echo "<html>"
echo "<head>"
echo "<meta http-equiv=\"Content-Type\" content=\"application/json; charset=UTF-8\">"
echo "<title>Fortran machine: Sum</title>"
echo "</head>"
echo "<body>"
echo "<pre>"

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

echo "</body>"
echo "</html>"

exit 0
