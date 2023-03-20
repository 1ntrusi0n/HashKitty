about_hk() {
	clear
	echo -ne "\e[36m
 ▄▄▄· ▄▄▄▄·       ▄• ▄▌▄▄▄▄▄
▐█ ▀█ ▐█ ▀█▪▪     █▪██▌•██  
▄█▀▀█ ▐█▀▀█▄ ▄█▀▄ █▌▐█▌ ▐█.▪
▐█ ▪▐▌██▄▪▐█▐█▌.▐▌▐█▄█▌ ▐█▌·
 ▀  ▀ ·▀▀▀▀  ▀█▄▀▪ ▀▀▀  ▀▀▀ 
\e[97m

\e[33mHash\e[94mKitty\e[97m was primarily created to help educate people that are new to the world of password cracking. 
By helping to automate the way Hashcat works, the goal is to help teach about the various methods of 
attacking a password hash. Using a mixture of easy-to-use menu options and GUI inputs, the process of using 
Hashcat is much easier than ever before.

This project is still in development, and if you have any ideas or features you want to see, feel free to give me a shout!

This script was created with the intent of $(ColorLightYellow 'educating')\e[97m people interested in penetration testing.
I'm $(ColorRed 'not responsible')\e[97m for any misuse of this tool for illegal activities.


Press $(ColorLightBlue 'ENTER')\e[97m to return to the main menu.."
	read
	main_menu
}