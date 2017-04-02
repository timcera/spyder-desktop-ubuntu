#!/bin/bash

# Put any tasks you would like to have carried
# out when the container is first created here

USER_NAME=`basename $HHHOME`
HOME_NAME=`dirname $HHHOME`

USER_ID=`ls -lahn $HOME_NAME | grep $USER_NAME | awk {'print $3'}`
GROUP_ID=`ls -lahn $HOME_NAME | grep $USER_NAME | awk {'print $4'}`

groupadd -g $GROUP_ID spyder
useradd --shell /bin/bash --uid $USER_ID --gid $GROUP_ID $USER_NAME

SPYDER=`which spyder3`
su $USER_NAME -c ${SPYDER}

