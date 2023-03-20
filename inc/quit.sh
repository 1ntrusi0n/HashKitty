trap ctrl_c INT

ctrl_c () {
	clear
	echo ""
	echo $(ColorLightYellow 'Thanks for using HashKitty!')
	echo ""
	echo $(ColorLightRed 'Now exiting..')
	sleep 1
	clear
	exit 0
}