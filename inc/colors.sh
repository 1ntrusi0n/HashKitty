####################
# Color  Variables #
####################
red="\e[31m"
lightred="\e[91m"
blue='\e[34m'
lightblue='\e[94m'
green='\e[32m'
lightgreen='\e[92m'
yellow='\e[33m'
lightyellow='\e[93m'
magenta='\e[35m'
lightmagenta='\e[95m'
cyan='\e[36m'
lightcyan='\e[96m'
lightgray='\e[37m'
white='\e[97m'
clear='\e[0m'

###################
# Color Functions #
###################
ColorRed(){
	echo -ne $red$1$clear
}
ColorLightRed(){
	echo -ne $lightred$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}
ColorLightBlue(){
	echo -ne $lightblue$1$clear
}
ColorGreen(){
	echo -ne $green$1$clear
}
ColorLightGreen(){
	echo -ne $lightgreen$1$clear
}
ColorYellow(){
	echo -ne $yellow$1$clear
}
ColorLightYellow(){
	echo -ne $lightyellow$1$clear
}
ColorMagenta(){
	echo -ne $magenta$1$clear
}
ColorLightMagenta(){
	echo -ne $lightmagenta$1$clear
}
ColorCyan(){
	echo -ne $cyan$1$clear
}
ColorLightCyan(){
	echo -ne $lightcyan$1$clear
}
ColorLightGray(){
	echo -ne $lightgray$1$clear
}
ColorWhite(){
	echo -ne $white$1$clear
}
