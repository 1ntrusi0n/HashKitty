load_hash_list() {
	clear
	echo -ne "
Please select a list of hashes to load.

"
	hash_list_file=`zenity --file-selection --title="Select Your Hash List File"`
	echo $hash_list_file > $MAIN_DIR/stored_hash/hash_value.txt

	case $? in
	    0)
            echo -ne "
\e[33m#############################################
\e[97mHash list file set as:
\e[36m\"$hash_list_file\" 
\e[33m#############################################
" ;;
	    1)
            echo "No file selected.";;
	    -1)
            echo "An unexpected error has occurred.";;
	esac
	echo ""
	echo "Press ENTER to return to the main menu."
	read
	main_menu
}