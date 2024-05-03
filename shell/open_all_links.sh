#! /bin/bash

# who/ style links
if [[ $1 =~ .*@$ ]]; then
    echo if $1 >> ~/open_log.txt
    LDAP=${1%?}
    open http://who/$LDAP
# go/ style links; handles `google3/` and `scripts2/` as well.
elif [[ $1 =~ ^[a-z]+[23]*\/ ]]; then
    echo elif $1 >> ~/open_log.txt
    open http://$1
# All other links
else
    echo else $1 >> ~/open_log.txt
    open $1
fi
