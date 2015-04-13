#! bin/bash
Root="/*"
Root_EXCLUDE_DIRS="-- exclude=/lost+found --exclude=/proc --exclude=/mnt --exclude=/sys --exclude=/backup.tgz"


if ["$USER" != "root"]; then 
	echo "You are not root user, use: sudo bachup"
	exit
fi
clear
echo "|-----------------------------------------------------"
echo "|------------------------Backup Yous System---------"
echo "|-----------------------------------------------------"

OPTIONS="Backup Restore Exit"
List = "1)Backup 2)Restore 3)Exit"

select opt in $OPTIONS; do
if ["$opt" = "Exit"]; then
	clear
	exit

elif ["$opt" = "Backup"]; then
	tar cvpzf /backup.tgz $ROOT_EXCLUDE_DIRS
	echo "Backup Complete"
	exit

elif ["$opt" = "Restore"]; then
	tar xvpzf $BACKUP_FILE -C /
	echo "|	RESTOR COMPLETE "
	
	if [[ -e "/proc" ]];
		echo "$CREATE_DIRS already exists "
	else 
		mkdir $CREATE_DIRS
	echo "$CREATE_DIRS are created! "
	fi
	exit
else
	clear 
	echo "Bad Option! Select 1 or 2 or 3 from Option Menu"
	echo $LIST
fi
done
