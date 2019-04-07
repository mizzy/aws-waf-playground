#!/bin/sh

host=`terraform output instance_public_dns`

scp httpd $host:~/
ssh $host /home/ubuntu/httpd

