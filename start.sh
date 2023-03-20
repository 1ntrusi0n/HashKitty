# Title: HashKitty
# Description: A tool to help automate Hashcat
# By: 1ntrusi0n
# Last Update: 3/20/23

# Imports
source $(dirname "$0")/inc/colors.sh
source $(dirname "$0")/inc/initial_checks.sh
source $(dirname "$0")/inc/load_single_hash.sh
source $(dirname "$0")/inc/load_hash_list.sh
source $(dirname "$0")/inc/select_hash_type.sh
source $(dirname "$0")/inc/clear_saved_hashes.sh
source $(dirname "$0")/inc/clear_saved_hash_type.sh
source $(dirname "$0")/inc/dictionary_attack.sh
source $(dirname "$0")/inc/brute_force_attack.sh
source $(dirname "$0")/inc/mask_attack.sh
source $(dirname "$0")/inc/hybrid_attack.sh
source $(dirname "$0")/inc/rule_based_attack.sh
source $(dirname "$0")/inc/combinator_attack.sh
source $(dirname "$0")/inc/attack_type_tutorial.sh
source $(dirname "$0")/inc/about.sh
source $(dirname "$0")/inc/quit.sh

# Variables
MAIN_DIR=$(pwd)
hash_type=$(cat $MAIN_DIR/stored_hash/hash_type.txt)
hash_value=$(cat $MAIN_DIR/stored_hash/hash_value.txt)

main_menu() {
	clear
	initial_checks
	echo -ne "

	\e[93m ▄  █ ██      ▄▄▄▄▄    ▄  █ \e[94m█  █▀ ▄█    ▄▄▄▄▀ ▄▄▄▄▀ ▀▄    ▄ 
	\e[93m█   █ █ █    █     ▀▄ █   █ \e[94m█▄█   ██ ▀▀▀ █ ▀▀▀ █      █  █  
	\e[93m██▀▀█ █▄▄█ ▄  ▀▀▀▀▄   ██▀▀█ \e[94m█▀▄   ██     █     █       ▀█   
	\e[93m█   █ █  █  ▀▄▄▄▄▀    █   █ \e[94m█  █  ▐█    █     █        █    
	\e[93m   █     █               █  \e[94m  █    ▐   ▀     ▀       ▄▀     
	\e[93m  ▀     █               ▀   \e[94m ▀                              
	\e[93m       ▀                    \e[94m                                

	\e[0m$(ColorLightMagenta 'A tool to help automate the use of hashcat') 
		  $(ColorLightYellow 'Created by:') $(ColorLightRed '1ntrusi0n')
		  Last updated: $(ColorBlue '3/19/23')

$(ColorLightCyan 'Hash Value/List:') $hash_status
$(ColorLightCyan 'Hash Type:') $hash_type_status

$(ColorWhite '######### Hash Settings #########')
$(ColorWhite '1)') $(ColorGreen 'Load A Single Hash')
$(ColorWhite '2)') $(ColorGreen 'Load A Hash List')
$(ColorWhite '3)') $(ColorGreen 'Select Hash Type')
$(ColorWhite '4)') $(ColorLightYellow 'Clear Saved Hash Values')
$(ColorWhite '5)') $(ColorLightYellow 'Clear Saved Hash Type')
$(ColorWhite '#################################')

$(ColorWhite '########## Hash Tools ##########')
$(ColorWhite '6)') $(ColorLightBlue 'Dictionary Attack')
$(ColorWhite '7)') $(ColorLightBlue 'Brute-Force Attack') $(ColorLightRed '(SLOW!)')
$(ColorWhite '8)') $(ColorLightBlue 'Mask Attack')
$(ColorWhite '9)') $(ColorLightBlue 'Hybrid Attack')
$(ColorWhite '10)') $(ColorLightBlue 'Rule-Based Attack')
$(ColorWhite '11)') $(ColorLightBlue 'Combinator Attack')
$(ColorWhite '#################################')

$(ColorWhite '############# Help #############')
$(ColorWhite '12)') $(ColorLightGray 'Attack Type Help')
$(ColorWhite '13)') $(ColorLightGray 'About HashKitty')
$(ColorWhite '#################################')

$(ColorWhite '############# Quit #############')
$(ColorWhite '0)') Exit
$(ColorWhite '#################################')

$(ColorLightYellow 'Your Selection:') "
    read main_menu_selection
    case $main_menu_selection in
        1) load_single_hash ;;
        2) load_hash_list ;;
		3) select_hash_type ;;
		4) clear_saved_hashes ;;
		5) clear_saved_hash_type ;;
		6) dictionary_attack ;;
		7) brute_force_attack ;;
		8) mask_attack ;;
		9) hybrid_attack ;;
		10) rule_based_attack ;;
		11) combinator_attack ;;
		12) attack_type_tutorial ;;
		13) about_hk ;;
        0) ctrl_c ;;
    esac
}

main_menu