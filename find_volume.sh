#!/bin/bash

found=false
ls -1 /tmp | while read line;
do
	if [ "$line" == "$(python rancher2.py --project ghwstore2 --namespace qa --claimspace magento2 --token token-mrbzj: TOKEN)" ]
	then
		$found=true	
        fi
done
echo $found
