#!/bin/bash

#############################################################################################################
### The purpose of this script is to create a template to deploy a file/folder to every user dynamically. ###
#############################################################################################################

#############################################################################################
### Get a list of users, filtering out service accounts, root, daemon, mfe, and nobody... ###
### If you need to filter out more users, use -e 'username' #################################
### Run this command and then echo it to ensure you are obtaining the list of users that ####
### you are expecting.#######################################################################
#############################################################################################
users=$(dscl . list /Users | grep -v -e '_' -e 'root' -e 'daemon' -e 'nobody' -e 'mfe')

##################################
### Store Users into an array. ###
##################################
usersArray=($users)

############################
### Get Length of Array. ###
############################
arrayLength=$(echo ${#usersArray[@]})

########################################################################
### Loop to dynamically action a script to all users on the machine. ###
########################################################################

###############
### Counter ###
###############
i=0

while [ $i -le $(( $arrayLength - 1 )) ];
do	
	########################################################################
	### Enter Script Here. #################################################
	########################################################################
	### Example: sudo cp -R /Users/${usersArray[$i]}/Library/HelloWorld/ ###
	########################################################################
	
	#########################
	### Increment Counter ###
	#########################
	i=$(( $i + 1 ))
done