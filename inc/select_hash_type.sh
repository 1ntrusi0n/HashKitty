select_hash_type() {
	clear
	echo -ne "

\e[33m██╗  ██╗ █████╗ ███████╗██╗  ██╗    \e[94m████████╗██╗   ██╗██████╗ ███████╗
\e[33m██║  ██║██╔══██╗██╔════╝██║  ██║    \e[94m╚══██╔══╝╚██╗ ██╔╝██╔══██╗██╔════╝
\e[33m███████║███████║███████╗███████║    \e[94m   ██║    ╚████╔╝ ██████╔╝█████╗  
\e[33m██╔══██║██╔══██║╚════██║██╔══██║    \e[94m   ██║     ╚██╔╝  ██╔═══╝ ██╔══╝  
\e[33m██║  ██║██║  ██║███████║██║  ██║    \e[94m   ██║      ██║   ██║     ███████╗
\e[33m╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    \e[94m   ╚═╝      ╚═╝   ╚═╝     ╚══════╝
                                                                      
"

hash_type=$(zenity --list --radiolist --title "Hash Type" --text "Select Your Hash Type:" --width "400" --height "400" --column " " --column "Hashcat Code" --column "Hash Name" FALSE "900" "MD4" FALSE "0" "MD5" \
	 FALSE "10" "MD5 (Password:Salt)" FALSE "20" "MD5 (Salt:Password)" FALSE "100" "SHA1" FALSE "1400" "SHA2-256" FALSE "1700" "SHA2-512")
echo $hash_type > $MAIN_DIR/stored_hash/hash_type.txt
echo "Hash type set. Reloading the main menu.."
sleep 1.5
main_menu
}