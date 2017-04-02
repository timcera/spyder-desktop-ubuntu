#!/bin/bash

# Put any tasks you would like to have carried
# out when the container is first created here

USER_NAME=`basename $HHHOME`
HOME_NAME=`dirname $HHHOME`

USER_ID=`ls -lahn $HOME_NAME | grep $USER_NAME | awk {'print $3'}`
GROUP_ID=`ls -lahn $HOME_NAME | grep $USER_NAME | awk {'print $4'}`

groupadd -g $GROUP_ID spyder
useradd --shell /bin/bash --uid $USER_ID --gid $GROUP_ID $USER_NAME
PYTHON=`which python3`
PYTHONDIR=`dirname $PYTHON`
su $USER_NAME -c "$PYTHONDIR/spyder3"

