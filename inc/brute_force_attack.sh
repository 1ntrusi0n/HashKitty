brute_force_attack() {
	clear
	echo -ne "
▄▄▄▄· ▄▄▄  ▄• ▄▌▄▄▄▄▄▄▄▄ .·▄▄▄      ▄▄▄   ▄▄· ▄▄▄ .     ▄▄▄· ▄▄▄▄▄▄▄▄▄▄ ▄▄▄·  ▄▄· ▄ •▄ 
▐█ ▀█▪▀▄ █·█▪██▌•██  ▀▄.▀·▐▄▄·▪     ▀▄ █·▐█ ▌▪▀▄.▀·    ▐█ ▀█ •██  •██  ▐█ ▀█ ▐█ ▌▪█▌▄▌▪
▐█▀▀█▄▐▀▀▄ █▌▐█▌ ▐█.▪▐▀▀▪▄██▪  ▄█▀▄ ▐▀▀▄ ██ ▄▄▐▀▀▪▄    ▄█▀▀█  ▐█.▪ ▐█.▪▄█▀▀█ ██ ▄▄▐▀▀▄·
██▄▪▐█▐█•█▌▐█▄█▌ ▐█▌·▐█▄▄▌██▌.▐█▌.▐▌▐█•█▌▐███▌▐█▄▄▌    ▐█ ▪▐▌ ▐█▌· ▐█▌·▐█ ▪▐▌▐███▌▐█.█▌
·▀▀▀▀ .▀  ▀ ▀▀▀  ▀▀▀  ▀▀▀ ▀▀▀  ▀█▄▀▪.▀  ▀·▀▀▀  ▀▀▀      ▀  ▀  ▀▀▀  ▀▀▀  ▀  ▀ ·▀▀▀ ·▀  ▀


"

########################
# Check for hash value #
########################
if [ -s $MAIN_DIR/stored_hash/hash_value.txt ]; then
	sleep 1.5
	echo -ne "
\e[97mHash value is $(ColorLightGreen 'set').
"
else
	echo -ne "
$(ColorRed 'Hash value not set! Please set that first!')
"
sleep 2
main_menu
fi

########################
# Check for hash type  #
########################
if [ -s $MAIN_DIR/stored_hash/hash_type.txt ]; then
	sleep 1.5
	echo -ne "
\e[97mHash type is $(ColorLightGreen 'set').
"
else
	echo -ne "
$(ColorRed 'Hash type not set! Please set that first!')
"
sleep 2
main_menu
fi

sleep 1.5
echo -ne "
\e[92mAll fields are set!  \e[93mStarting attack..\e[0m

"
hashcat -m "$hash_type" -a3 -1 ?a "$hash_value" ?1?1?1?1?1?1?1?1?1?1 -i
echo -ne "

\e[94mComplete. Press ENTER to return to the main menu."
read
main_menu
}