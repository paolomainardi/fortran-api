#!/bin/bash
source libs/common
res=$(echo "${var_a},${var_b},${var_c}" | /fortran/triangle-area 2>&1)
retVal=$?
if [ $retVal -ne 0 ]; then
    json_error "${res}" $retVal
    exit 0
fi
printf '{"data": {"result": "%s"}}\n' $(echo $res | awk '{ print $8 }')
exit 0