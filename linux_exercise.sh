#!/bin/bash

# There are improvments that could have been done, but considering the script purpose- I am fine with that :)

####
#### Colors;
####
#### https://misc.flogisoft.com/bash/tip_colors_and_formatting
####
NC='\033[0m'
CYA='\033[3;36m'
GRE='\e[38;5;46m'
BLU='\e[38;5;27m \e[1m'
RED_it='\033[3;31m'
YEL='\e[38;5;226m'
F_RED='\033[5;31m'
ORG='\e[38;5;166m' 
F_ORG='\e[38;5;202m \e[5m'
D_ORG='\e[38;5;220m'
G_W='\e[48;5;22m\e[38;5;256m'
R_W='\e[48;5;52m\e[38;5;256m'
####
#### Setting the questions and answers in indexed arrays;
####
questions=(
	"	${R_W}1.${NC} Display two commands that can give you instructions on the command ls. \n\n"
	
	"	${R_W}2.${NC} Create the following directory structure; \n
		* Two folders; ${YEL}/users${NC}  and ${YEL}/support${NC}. \n 
		* Under ${YEL}/users${NC} create the folders; user1, user2, user3, user4 \n 
		* Under ${YEL}/support${NC} create the folders; support1, support2, support3, support4, support5, support6 \n
		     - For folders support 4-6: Create these folders in a single command.
		     - For folders support 4-6: Remove these folders in a single command. \n\n"
		
	"       ${R_W}3.${NC} Create users 1-3 with the following modifications: \n 
		* Each user home folder shoulb be at ${YEL}/users${NC} with its respective name. \n
		* Each user should have a password of '${YEL}Aa1234${NC}'. \n
		* Define user1 and user2 with a shell of ${YEL}/bin/bash${NC}. \n
		* Define user1 to be obliged to change his password after 30 days and to be able to make any changes after 3 days. \n
		* Define user2 to expire at 31-12-2021 \n
		* Define user3 to be a system account, also, add the comment 'system account' for the user. \n\n"
		
	"       ${R_W}4.${NC} Change the default HOME directory for newly created users to be at ${YEL}/users${NC}. \n\n"

	"       ${R_W}5.${NC} Make sure you are able to login (Complete the requirements) and display only user1 and user2 home folders \n\n"

	"       ${R_W}6.${NC} Define new permissions for newly created folders as follows; \n
		* User - ${YEL}rwx${NC}. \n
		* Group - ${YEL}rw${NC}. \n
		* Others - ${YEL}X${NC}. \n\n"
		
	"       ${R_W}7.${NC} Create the following groups; \n
		* ${YEL}IT${NC} -> With user1 in it. \n
		* ${YEL}Users${NC} -> With user1 and user2 in it \n\n"
		
	"       ${R_W}8.${NC} Create a file called q8.txt under user1 HOME directory and apply to it the following permissions (In numeric): \n
		* User - ${YEL}rw${NC}. \n
		* Group - ${YEL}r${NC}. \n
		* Othera - ${YEL}x${NC}. \n
		* Make sure the users group has access to the file. \n\n"

	"       ${R_W}9.${NC} Create user4 and perform the following; \n
		* Add user4 to IT and users groups. \n
		* Display the groups associated with user4. \n
		* Display only the IT and users groups at ${YEL}/etc/groups${NC}. \n
		* Copy the following folders to the /Documents directory: \n
		     - ${YEL}/etc/passwd${NC}. \n
		     - ${YEL}/etc/groups${NC}. \n
		     - ${YEL}/etc/network/interfaces${NC}. \n\n"

	"       ${R_W}10.${NC} Export all of the user names at ${YEL}/etc/passwd${NC} and save them as ${YEL}users.csv${NC} (With the relevant text format). \n\n"

	"       ${R_W}11.${NC} Create and perform the following; \n
		* Create 10 .txt files in one command, name them 1-10.txt \n
		* For each file, input the text- 'never say never' \n
		* Print all the numbered files to file.txt \n
		* Present the size of all the files and folders under the home directory of the relevant user. \n\n" 

	"       ${R_W}12.${NC} Display all the directories at ${YEL}/etc${NC} without sub-directories and with the following filters; \n
		* Show only folders/files that support ASCII encoding. \n
		* Filter the list by name (Descending) \n
		* Number each line of output. \n
		* Export your list to a file named etcfiles.txt \n\n"

	"       ${R_W}13.${NC} Print ${YEL}/etc/passwd${NC} in one command, according to the following; \n
		* Print only the user names to users.txt \n
		* Print only the user names with the shells ${YEL}bash${NC} or ${YEL}zsh${NC} to users2.txt \n\n"

	"       ${R_W}14.${NC} Perform the following; \n
		* Create a ${YEL}symbolic link${NC}- password.txt, that refers to ${YEL}/etc/passwd${NC}. \n
		* Create a file named user.txt and input to it the text- 'Welcome user' \n
		* Create a ${YEL}hardlink${NC} to user1.txt named user2.txt and show it's working properly \n\n"

	"       ${R_W}15.${NC} Find all the files under ${YEL}/tmp${NC} that are more then 3 days from the current date and remove them. \n\n"

	"       ${R_W}16.${NC} Find all the ${YEL}.txt${NC} files under all of the avilable users ${YEL}HOME${NC} directories and copy them to your desktop. \n\n"

	"       ${R_W}17.${NC} Perform the following; \n
		* Set a ${YEL}static IP address${NC} of your choice to the device you are using. \n
		* Set the following DNS servers IP addresses for your device- ${YEL}8.8.8.8${NC} and ${YEL}9.9.9.9${NC}. \n
		* Connect with ${YEL}SSH${NC} to your Linux device. \n\n"

	"       ${R_W}18.${NC} Display your OS details, variables that are being used and running processes. \n\n"
	
	"       ${R_W}19.${NC} Display the size and RAM used, avilable and toal for ${YEL}/dev/sda1${NC}. \n\n"

) 			
export questions
####
answers=(
	"		${G_W}ls --help${NC} \n
		${G_W}man ls${NC} \n\n"
		
	"       		${G_W}cd <DIRECTORY>${NC} --> Optional. \n
		${G_W}ls -l <DIRECOTRY>${NC} --> Optional. \n
		${G_W}mkdir <FOLDER-DIRECTORY>${NC} \n
		${G_W}mkdir support4 support5 support6${NC} \n
		${G_W}rmdir support4 support5 support5${NC} \n\n"
		
	"		For user1 --> ${G_W}sudo useradd -s /bin/bash -p Aa1234 -d /users/user1 user1 sudo chage -m 3 -M 30 user1${NC} \n
		For user2 --> ${G_W}sudo useradd -s /bin/bash -p Aa1234 -d /users/user2 -e 2021-12-31 user2${NC} \n
		For user3 --> ${G_W}sudo useradd -p Aa1234 -s /usr/sbin/nologin -rM user3 && sudo usermod -c \"system account\" user3${NC} \n\n"
	
	"		${G_W}sudo nano /etc/default/useradd${NC} --> Replace # HOME=/home with HOME=/users \n\n"
	
	"		${G_W}sudo passwd <USER>${NC} --> Optional, for making sure a password was successfully set for the relevant user. \n
		${G_W}sudo chown <USER> <Directory>${NC} --> To give ownership permission to the relevant user on his HOME directory. \n
		${G_W}sudo usermod -a -G sudo <USER-NAME>${NC} --> Adding the relevant user to sudo, enabling him to execute sudo required commands. \n
		${G_W}cut -d: -f6 /etc/passwd | grep \"user[12]\"${NC} --> For displaying user1 and user2 HOME directories. \n\n"
		
	"		${G_W}sudo setafcl -Rdm u::rwx,g::rw,o::x /users${NC} \n\n"
	
	"		${G_W}sudo groupadd <GROUPNAME>${NC} \n
		${G_W}sudo adduser <USERNAME> <GROUPNAME>${NC} \n\n"
		
	"		${G_W}touch /users/user1/q8.txt${NC} \n
		${G_W}sudo chmod 641 /users/user1/q8.txt${NC} \n
		${G_W}sudo chown -R user1:users /users/user1/user1${NC} \n\n"
	
	"		${G_W}sudo usermod -a -G IT,users user4${NC} \n
		${G_W}id user4${NC} \n
		${G_W}grep -E '(^IT)|(^users)' /etc/group${NC} \n
		${G_W}cp -R /etc/passwd /etc/group /etc/network/interfaces ~/Documents${NC} \n\n"
		
	"		${G_W}cat /etc/passwd | cut -d: -f1 | sort -u |  sed \"s/$/, /\" | tee ~/Desktop/users.csv${NC} \n\n"
	
	"		${G_W}seq 10 | xargs -i touch ~/Desktop/{}.txt${NC} \n
		${G_W}for file in \$(seq 10); do echo 'never say never' > ~/Desktop/\$file.txt done${NC} \n
		${G_W}ls ~/Desktop/ | egrep '[0-9].txt' > ~/Desktop/'\$file.txt'${NC} \n
		${G_W}ls -Rs ~${NC} \n\n"
		
	"		${G_W}for f in \`find /etc -maxdepth 1 | sort\`; do echo "\$\f" ' -- ' \`file -bi "\$\f"\` | egrep -v '.*ascii.*' >> ~/Desktop/etcfiles.txt ; done${NC} \n
		${G_W}nl ~/Desktop/etcfiles.txt | tee ~/Desktop/etcfiles.txt${NC} \n\n"
		
	"		${G_W}cat /etc/passwd | egrep '.*\/bin\/(bash|zsh)$' | cut -d: -f-1,7 | sort -u | tr \":\" '\\\t\\\t' | \\  ${NC} \n
		${G_W}tee ~/Desktop/users2.txt && cat /etc/passwd | cut -d: -f1 | sort -u | tee ~/Desktop/users.txt${NC} \n\n"
	
	"		${G_W}ln -s /etc/passwd ~/Desktop/passwords.txt${NC} \n
		${G_W}touch ~/Desktop/user2.txt && echo Welcome user2 > ~/Desktop/user2.txt${NC} \n
		${G_W}ln ~/Desktop/user2.txt ~/Desktop/user3.txt${NC} \n\n"
		
	"		${G_W}sudo find /tmp -maxdepth 1 -type f -mtime +3 -delete${NC} \n\n"
	
	"		${G_W}cat /etc/passwd | cut -d: -f6 | sort -u | egrep '\/home\/|\/users\/' | tee ~/Desktop/usershome.txt && mkdir ~/Desktop/alltext.txt${NC} \n
		${G_W}while IFS= read -r home; do sudo find "\$\h\o\m\e" -type f -name "\*\.\t\x\t" -exec cp {} ~/Desktop/alltext \; ;done < ~/Desktop/usershome.txt && rm ~/Desktop/usershome.txt${NC} \n\n"
		
	"		For setting a static IP; \n
			${G_W}ifconfig -a${NC} \n
			${G_W}sudo ifconfig <INTERFACE> down${NC} \n
			${G_W}ifconfig <INTERFACE> <IP> netmask <SUBNET>${NC} \n
			${G_W}route add default gw <GATEWAY> <INTERFACE>${NC} \n
			${G_W}sudo ifconfig <INTERFACE> up${NC} \n
			${G_W}ifconfig -a${NC} \n\n
		For setting DNS server; \n
			We prefer to not automatically set DNS server IPs by changing the relevant config file permissions. \n
			Therefore, we'll access sudo nano /etc/resolv.conf and add to it \"nameserver <IP>\" in a new row. \n\n
		For setting an SSH connection; \n
			${G_W}sudo service ssh start${NC} \n
			${G_W}sudo service ssh status${NC} \n
			${G_W}sudo update-rc.d -f ssh remove${NC} \n
			${G_W}sudo update-rc.d -f ssh defaults${NC} \n
			${G_W}sudo service ssh restart${NC} \n
			${G_W}sudo nano /etc/motd${NC} --> Optional, for setting the message shown on login. \n
			${G_W}ssh <USER>@<DEVICE-IP>${NC} --> Type in oreder to access from a remote device. \n\n"
####
#### Check your file in the drive for more commands involving connections (Interfaces, IPs, tools etc.)
#### For more info on SSH --> https://linuxhint.com/enable_ssh_kali_linux_2020/	
####		
	"		${G_W}printf \\\n && uname -a && printf \\\n && printenv && printf \\\n && ps aux${NC} \n
		* You can use htop in order to get a live presentation of running processes. \n\n"

####
#### For full details on enviroment variables --> https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-set-environment-variables-in-linux/
####
		
	"		${G_W}printf \\\n Disk usage for the directory; \\\n && df -a /dev/sda1 && printf \\\n RAM usage for the direcotry; \\\n && free /dev/sda1${NC} \n\n"
####
#### Linux file system/structure explained --> https://www.youtube.com/watch?v=HbgzrKJvDRw
####			
			
		
)	
export answers


echo
echo
printf "\tdb      d888888b d8b   db db    db db    db\n" 
printf "\t88         88    888o  88 88    88  8b  d8 \n" 
printf "\t88         88    88V8o 88 88    88   8bd8 \n"                                     
printf "\t88         88    88 V8o88 88    88   dPYb \n"  
printf "\t88booo     88    88  V888 88b  d88  8P  Y8 \n" 
printf "\tY88888P Y888888P VP   V8P ~Y8888P' YP    YP \n" 
echo                                            
echo                                            
printf "\td88888b db    db d88888b d8888b   .o88b. d888888b .d8888. d88888b\n" 
printf "\t88'      8b  d8  88'     88   8D d8P  Y8    88    88   YP 88' \n"     
printf "\t88ooooo   8bd8   88ooooo 88oobY  8P         88     8bo    88ooooo \n" 
printf "\t88~~~~~   dPYb   88~~~~~ 88 8b   8b         88       Y8b  88~~~~~ \n" 
printf "\t88.      8P  Y8. 88.     88  88  Y8b  d8    88    db   8D 88. \n"     
printf "\tY88888P YP    YP Y88888P 88   YD   Y88P' Y888888P  8888Y' Y88888P \n" 
echo
echo 
printf "\t | Practice For Beginners |"
echo
echo                                                               
printf "\t By: ${RED_it}Eido Epstein${NC} | ""${CYA}linkedin.com/in/eido-epstein${NC}"
echo
echo
#### The header is from http://www.bagill.com/ascii-sig.php
echo
printf "###########################################################################################"
echo
function Menu () {
	printf "###########################################################################################"
	echo
	echo
	echo
	printf "\t\tO==============================================O\n"
	printf "\t\t|                                              |\n"
	printf "\t\t|  ${ORG}i${NC} - Install required extensions.            |\n"                                                       
	printf "\t\t|  ${ORG}s${NC} - Start exercise from the begining.       |\n"
	printf "\t\t|  ${ORG}p${NC} - Pick a specific part to begin from.     |\n" 
	printf "\t\t|  ${ORG}d${NC} - Display all the questions and answers.  |\n"
	printf "\t\t|                                              |\n" 
	printf "\t\t|  ${ORG}e${NC} - Exit                                    |\n"    
	printf "\t\t|                                              |\n" 
	printf "\t\tO==============================================O\n"
	echo
	echo
	printf " ${D_ORG}Type your choice:${NC}  "
	read choice
	export choice
	echo
	echo
}	
Menu
####
#### Installation Option;
####
declare -a ext_func_arr
	#### Pick manager ####
function OptionsPicksInstallation () {
	if [[ $option_i1 = n ]]; then
		echo
		printf " ${D_ORG}Continuing to the next extension;${NC}"
		echo
		echo
		while [ $option_i2 -lt 5 ]
			do
				if [[ $option_i1 = close ]]; then
					break
				else
					${ext_func_arr[$option_i2]}
					echo
					echo
					option_i2=$(expr "${option_i2}" + 1)
				fi
			done
	else
		echo
 		printf "${F_RED}	-------------------${NS}\n"
 		printf "${F_RED}	--- ${NC}Wrong input${F_RED} ---${NS}\n"
 		printf "${F_RED}	-------------------${NS}\n"
 		echo
 		echo	
 	fi
}
	#### open-vm-tools ext ####
function ext_func_arr.OpenVM () {
	printf "	Would you like to install ${YEL}open-vm-tools${NC} ? ${ORG}[y/n]${NC} \n
	* Open VM Tools (open-vm-tools) is the open source implementation of VMware Tools for Linux guest operating systems. \n"
	echo
	read ex
	case $ex in 
		"y")    echo
 			printf "${GRE} Installing...${NC}"
 			echo
 			echo 
 			sudo apt-get install open-vm-tools
 			option_i1=n
			option_i2=1
			export option_i1 option_i2
			OptionsPicksInstallation "$option_i1" "$option_i2"
		;;
		"n")    option_i1=n
			option_i2=1
			export option_i1 option_i2
			OptionsPicksInstallation "$option_i1" "$option_i2"
		;;
		*)	option_i1=close
			export option_i1
			OptionsPicksInstallation "$option_i1"
		;;
	esac
}
	#### tree ext ####
function ext_func_arr.Tree () {
	printf "	Would you like to install ${YEL}tree${NC} ? ${ORG}[y/n]${NC} \n
	* A tree is defined as a recursive directory listing program which generates a depth-indented file's list. \n"
	echo
	read ex
	case $ex in 
		"y")    echo
 			printf "${GRE} Installing...${NC}"
 			echo
 			echo 
 			sudo sudo apt-get install tree
		;;
		"n")    option_i1=n
			option_i2=2
			export option_i1 option_i2
			OptionsPicksInstallation "$option_i1" "$option_i2"
		;;
		*)	option_i1=close
			export option_i1
			OptionsPicksInstallation "$option_i1"
		;;
	esac
}
	#### ssh ext ####
function ext_func_arr.SSH () {
	printf "	Would you like to install ${YEL}ssh${NC} ? ${ORG}[y/n]${NC} \n
	* SSH is a client program for logging into a remote Linux/Unix server and for executing commands on a remote server. \n"
	echo
	read ex
	case $ex in 
		"y")    echo
 			printf "${GRE} Installing...${NC}"
 			echo
 			echo 
 			sudo apt-get install ssh
		;;
		"n")    option_i1=n
			option_i2=3
			export option_i1 option_i2
			OptionsPicksInstallation "$option_i1" "$option_i2"
		;;
		*)	option_i1=close
			export option_i1
			OptionsPicksInstallation "$option_i1"
		;;
	esac
}
	#### openssh-server ext ####
function ext_func_arr.Openssh () {
	printf "	Would you like to install ${YEL}openssh-server${NC} ? ${ORG}[y/n]${NC} \n
	* sshd (OpenSSH Daemon or server) is the daemon program for ssh client. It is a free and open source ssh server. \n"
	echo
	read ex
	case $ex in 
		"y")    echo
 			printf "${GRE} Installing...${NC}"
 			echo
 			echo 
 			sudo apt install openssh-server
		;;
		"n")    option_i1=n
			option_i2=4
			export option_i1 option_i2
			OptionsPicksInstallation "$option_i1" "$option_i2"
		;;
		*)	option_i1=close
			export option_i1
			OptionsPicksInstallation "$option_i1"
		;;
	esac
}
	#### htop ext ####
function ext_func_arr.Htop () {
	printf "	Would you like to install ${YEL}htop${NC} ? ${ORG}[y/n]${NC} \n
	* Htop is a free and open source ncurses-based process viewer for Linux. \n"
	echo
	read ex
	case $ex in 
		"y")    echo
 			printf "${GRE} Installing...${NC}"
 			echo
 			echo 
 			sudo apt install htop
 			echo
 			echo
 			printf " ${D_ORG}That is all, back to the menu...${NC}"
 			echo
 			echo 
 			bash ~/Desktop/Linux\ Exercise.sh
		;;
		"n")    echo
			echo
			printf " ${D_ORG}Back to the Menu...${NC}"
			echo
			echo
			bash ~/Desktop/Linux\ Exercise.sh
		;;
		*)	echo
			echo
			printf "${F_RED}	-------------------${NS}\n"
 			printf "${F_RED}	--- ${NC}Wrong input${F_RED} ---${NS}\n"
 			printf "${F_RED}	-------------------${NS}\n"
 			echo
 			echo
		;;
	esac
}
	#### Setting ext_func_arr wth the functions ####
ext_func_arr[0]="ext_func_arr.OpenVM"
ext_func_arr[1]="ext_func_arr.Tree"
ext_func_arr[2]="ext_func_arr.SSH"
ext_func_arr[3]="ext_func_arr.Openssh"
ext_func_arr[4]="ext_func_arr.Htop"
####
#### Functions for displaying questions and answers.
####
function OptionsQuestionPick () {
	if [[ $option_q = 0 ]]; then
		f=0
		for (( $f ; f<19 ; f++ ));
			do
			if [[ $c = close ]]; then
				break
			else
				printf "${questions[$f]}"
				printf  "	${ORG}n${NC} - Next question | ${ORG}s${NC} - Show answer \n"
				read option_q
				OptionsQuestion "$option_q" "$f"
			fi
		done	
	elif [[ $option_q =~ (^[1-9]$)|(^1[0-9]$) ]]; then
		f=$option_q
		for (( $f ; f<19 ; f++ ));
			do
			if [[ $c = close ]]; then
				break
			else
				printf "${questions[$f]}"
				printf  "	${ORG}n${NC} - Next question | ${ORG}s${NC} - Show answer \n"
				read option_q
				OptionsQuestion "$option_q" "$f"
			fi
		done
	else
		echo
		echo
		printf "${F_RED}	-------------------${NS}\n"
 		printf "${F_RED}	--- ${NC}Wrong input${F_RED} ---${NS}\n"
 		printf "${F_RED}	-------------------${NS}\n"
 		echo
 		echo
	fi
}
####
function OptionsAnswer () {
	case $option_a in
		"n")	# No need for any command, the next question will display due to the loop.
		;;
		*)	echo
			echo
			printf "${F_RED}	-------------------${NS}\n"
 			printf "${F_RED}	--- ${NC}Wrong input${F_RED} ---${NS}\n"
 			printf "${F_RED}	-------------------${NS}\n"
 			echo
 			echo
 			c=close
			export c
		;;
	esac
}
####	
function OptionsQuestion () {
	case $option_q in
		"n")	# No need for any command, the next question will display due to the loop.
		;;
		"s")	printf "${answers[$f]}"
			printf  "	${ORG}n${NC} - Next question \n"
			echo
			read option_a
			OptionsAnswer "$option_a"
		;;
		*)	echo
			echo
			printf "${F_RED}	-------------------${NS}\n"
 			printf "${F_RED}	--- ${NC}Wrong input${F_RED} ---${NS}\n"
 			printf "${F_RED}	-------------------${NS}\n"
 			echo
 			echo
 			c=close
			export c
		;;
	esac
}	
####
#### Operating the options;
####
	#### Installing extensions ####
if [[ $choice = i ]]; then
	ext_func_arr.OpenVM
	
	#### Start fron the begining ####
elif [[ $choice = s ]]; then
	option_q=0
	export option_q
	OptionsQuestionPick "$option_q"
					
	#### Pick a question ####
elif [[	$choice = p ]]; then	
	printf "	From which question would you like to start from? ${ORG}[1-19]${NC}\n"
	read option_q
	let "option_q--"
	export option_q
	OptionsQuestionPick "$option_q"

	#### Display all ####
elif [[	$choice = d ]]; then
	for (( q=0 ; q<19 ; q++ ));
		do
		printf "${questions[$q]}"
		printf "${answers[$q]}"		
		done
		
	#### Exit script ####	
elif [[	$choice = e ]]; then
	exit

	#### Wrong input ####	
else
	echo
	echo
	printf "${F_RED}	-------------------${NS}\n"
 	printf "${F_RED}	--- ${NC}Wrong input${F_RED} ---${NS}\n"
 	printf "${F_RED}	-------------------${NS}\n"
 	echo
 	echo
fi
