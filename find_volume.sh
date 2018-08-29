#!/bin/bash

found=false
ls -1 /tmp | while read line;
do
	if [ "$line" == "$(python rancher2.py --project ghwstore2 --namespace qa --claimspace magento2 --token token-mrbzj:b8qrhgk6bk4kt9ll9sn9j9xpw8s5ttw5mk4pfwzpbkw9wm5rdhlf2b)" ]
	then
		$found=true	
        fi
done
echo $found
