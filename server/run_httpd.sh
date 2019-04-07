#!/bin/sh

dir=`dirname $0`

pushd $dir/../terraform
host=`terraform output instance_public_dns`
popd

scp $dir/httpd $host:~/
ssh $host /home/ubuntu/httpd
