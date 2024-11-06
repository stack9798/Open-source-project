#!/bin/bash

read -p "Is Lectures fun? (Yes / no): " answer

case "$answer" in
	*[yY]* | *[yY][eE][sS]*)
		 echo "Thank you for enjoying it!"
		 ;;
	*[nN]* | *[nN][oO]*)
		 echo "Sorry to hear that. We'll try to improve."
		 ;;
	*)
		 echo "Please answer with yes or no."
		 ;;

esac

		
