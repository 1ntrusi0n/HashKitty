load_single_hash() {
	clear
	echo -ne "

#                               #     #                      
#        ####    ##   #####     #     #   ##    ####  #    # 
#       #    #  #  #  #    #    #     #  #  #  #      #    # 
#       #    # #    # #    #    ####### #    #  ####  ###### 
#       #    # ###### #    #    #     # ######      # #    # 
#       #    # #    # #    #    #     # #    # #    # #    # 
#######  ####  #    # #####     #     # #    #  ####  #    # 

"
hash_value=$(zenity --entry --title "Load Hash Value" --text "Enter your hash value below:" --width "500" --height "100")

echo $hash_value > $(dirname "$0")/stored_hash/hash_value.txt
echo -ne "
Hash value saved as: $(ColorWhite $hash_value)


$(ColorLightBlue 'Hash loaded sucessfully...Reloading the main menu.')"
sleep 1.5
clear
main_menu
}