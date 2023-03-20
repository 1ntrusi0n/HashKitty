dictionary_attack() {
	clear
	echo -ne "
\e[93m·▄▄▄▄  ▪   ▄▄· ▄▄▄▄▄▪         ▐ ▄  ▄▄▄· ▄▄▄   ▄· ▄▌    \e[94m ▄▄▄·▄▄▄▄▄▄▄▄▄ ▄▄▄·  ▄▄· ▄ •▄ 
\e[93m██▪ ██ ██ ▐█ ▌▪•██  ██ ▪     •█▌▐█▐█ ▀█ ▀▄ █·▐█▪██▌    \e[94m▐█ ▀█•██ •██  ▐█ ▀█ ▐█ ▌▪█▌▄▌▪
\e[93m▐█· ▐█▌▐█·██ ▄▄ ▐█.▪▐█· ▄█▀▄ ▐█▐▐▌▄█▀▀█ ▐▀▀▄ ▐█▌▐█▪    \e[94m▄█▀▀█ ▐█.▪▐█.▪▄█▀▀█ ██ ▄▄▐▀▀▄·
\e[93m██. ██ ▐█▌▐███▌ ▐█▌·▐█▌▐█▌.▐▌██▐█▌▐█ ▪▐▌▐█•█▌ ▐█▀·.    \e[94m▐█ ▪▐▌▐█▌·▐█▌·▐█ ▪▐▌▐███▌▐█.█▌
\e[93m▀▀▀▀▀• ▀▀▀·▀▀▀  ▀▀▀ ▀▀▀ ▀█▄▀▪▀▀ █▪ ▀  ▀ .▀  ▀  ▀ •     \e[94m ▀  ▀ ▀▀▀ ▀▀▀  ▀  ▀ ·▀▀▀ ·▀  ▀
"

	echo -ne "

$(ColorLightBlue 'Select your dictionary file.')
If you do not have one, I have included one in the $(ColorWhite '/resources/dictionaries/') folder.

"

	dict_file=`zenity --file-selection --title="Select Your Dictionary File"`

	case $? in
	    0)
            echo -ne "
\e[33m#############################################
\e[97mDictionary file set as:
\e[36m\"$dict_file\" 
\e[33m#############################################
" ;;
	    1)
            echo -ne "
No file selected.
\e[91mReturning to main menu..
";
            sleep 1.5
            main_menu ;;
	    -1)
            echo -ne "
An unexpected error has occurred.
\e[91mReturning to main menu..
";
            sleep 1.5
            main_menu ;;
	esac

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
	hashcat -m "$hash_type" "$hash_value" "$dict_file"
	echo -ne "

\e[94mComplete. Press ENTER to return to the main menu."
	read
	main_menu
}