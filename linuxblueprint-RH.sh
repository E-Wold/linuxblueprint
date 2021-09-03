#!/bin/bash

##################################################################################
# linuxblueprint.sh
# Authors: James McNabb, Eric Wold, Arsam Pathan, Dylan Chamberlain
# 
#
# This script "blueprints" a linux system and gathers information for  
# system vetting needs and generates a report of in the current working
# directory. An overview of report secitons can be found below.
# 
#
# Report Sections:
# 1.  Host Name
# 2.  System Information
# 3.  Hardware Information
# 4.  Banners
# 5.  Host File
# 6.  DNS IInformation
# 7.  User Information
# 8.  Goups Information
# 9.  Home Directories
# 10. Installed Software
# 11. Services and Statuses
# 12. Open Ports
# 13. Cron Jobs
# 14. Firewall Setup
# 15. SSH Setup
# 16. Webserver Information
# 17. SSL Information
# 18. Samba/SMB Informaiton
# 19. App Armor/SeLinux Informaiton
# 20. Syslog Information
# 21. Fail2Ban Information
# 22. SNMP Information
# 23. Printer Information
# 24. Local NFS information
#
# Usage: sudo ./linuxblueprint.sh
#
# Report Name: YYmmddHHMMSS-{Hostname}-Blueprint.txt
# 
##################################################################################

# Hostname
# use the variable $HOSTNAME to show hostname
#Create Date Stamp
mydate=`date +"%Y%m%d%H%M%S"`
#Create Logfiles
myoutfile="$mydate-$HOSTNAME-Blueprint.txt"

# Write file header
echo " " >> $myoutfile
echo "   __    _                  ____  __                      _       __ " >> $myoutfile
echo "  / /   (_)___  __  ___  __/ __ )/ /_  _____  ____  _____(_)___  / /_" >> $myoutfile
echo " / /   / / __ \/ / / / |/_/ __  / / / / / _ \/ __ \/ ___/ / __ \/ __/" >> $myoutfile
echo "/ /___/ / / / / /_/ />  </ /_/ / / /_/ /  __/ /_/ / /  / / / / / /_  " >> $myoutfile
echo "_____/_/_/ /_/\__,_/_/|_/_____/_/\__,_/\___/ .___/_/  /_/_/ /_/\__/  " >> $myoutfile
echo "                                          /_/                        " >> $myoutfile                        
echo " " >> $myoutfile
echo "---------------------------------------------------------------------" >> $myoutfile
echo "Linux Bluprint for $HOSTNAME on $mydate" >> $myoutfile
echo "---------------------------------------------------------------------" >> $myoutfile
echo " " >> $myoutfile
# Table of contents
echo  "Table of Contents:" >> $myoutfile
echo  "1.  Host Name" >> $myoutfile
echo  "2.  System Information" >> $myoutfile
echo  "3.  Hardware Information" >> $myoutfile
echo  "4.  Banners" >> $myoutfile
echo  "5.  Host File" >> $myoutfile
echo  "6.  DNS IInformation" >> $myoutfile
echo  "7.  User Information" >> $myoutfile
echo  "8.  Goups Information" >> $myoutfile
echo  "9.  Home Directories" >> $myoutfile
echo  "10. Installed Software" >> $myoutfile
echo  "11. Services and Statuses" >> $myoutfile
echo  "12. Open Ports" >> $myoutfile
echo  "13. Cron Jobs" >> $myoutfile
echo  "14. Firewall Setup" >> $myoutfile
echo  "15. SSH Setup" >> $myoutfile
echo  "16. Webserver Information" >> $myoutfile
echo  "17. SSL Information" >> $myoutfile
echo  "18. Samba/SMB Informaiton" >> $myoutfile
echo  "19. App Armor/SeLinux Informaiton" >> $myoutfile
echo  "20. Syslog Information" >> $myoutfile
echo  "21. Fail2Ban Information" >> $myoutfile
echo  "22. SNMP Information" >> $myoutfile
echo  "23. Printer Information" >> $myoutfile
echo  "24. Local NFS information" >> $myoutifle
echo " " >> $myoutfile

#### Main ####
echo "Running Linux Blueprint on $HOSTNAME"
echo "Determining the Linux Disribution"

# Determine the OS, then take action.
if [[ `which apt` ]]; then
    # Debian Based Commands go Here
   IS_DEBIAN=1
   echo "Debian Based OS..."
   
   ########################
   # PUT DEBIAN CODE HERE
   #########################

   # Hostname
   echo "###################################" >> $myoutfile
   echo "1 - Host Name" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Hostname..."
   (uname -n) >>$myoutfile
   echo " " >> $myoutfile

   # System Information
   echo "###################################" >> $myoutfile
   echo "2 - System Information " >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "OS Release" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Checking OS info..."
   echo "info from /etc/os-release.." >> $myoutfile
   cat /etc/os-release | grep -E 'ID_LIKE|NAME|VERSION_ID' |grep -v 'PRETTY_NAME' >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Kernal Information" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   # Kernal name system ,version, release, hardware Name
   echo " " >> $myoutfile
   echo "Checking Kernal name and version info..."
   uname -a >> $myoutfile
   echo " " >> $myoutfile
   #Disk Information   
   echo "--------------------------------" >> $myoutfile
   echo "Disk Information" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Disk Mount info..."
   lsblk >> $myoutfile
   echo " " >> $myoutfile
   #Disk Space  
   echo "--------------------------------" >> $myoutfile
   echo "Disk Space" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Disk Space..."
   df -H  >> $myoutfile
   echo " " >> $myoutfile
   # Mounted disks
   echo "--------------------------------" >> $myoutfile
   echo "Mounted Disks" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Disk Mountes..."
   mount | column -t >> $myoutfile
   echo " " >> $myoutfile
   # Fstab config information
   echo "--------------------------------" >> $myoutfile
   echo "Fstab" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Fstab info..."
   blkid >> $myoutfile
   echo " " >> $myoutfile
   #Network Information
   echo "--------------------------------" >> $myoutfile
   echo "Network Information" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking NW Adapter info..."
   #sudo lshw -class network -short >> $myoutfile
   ip a >> $myoutfile
   echo " " >> $myoutfile

   # Hardware Information
   echo "###################################" >> $myoutfile
   echo "3 - Hardware Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "CPU - lscpu" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lscpu >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Memory" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   free -m >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Hardware List - lshw" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lshw -short >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Hardware Info - hwinfo" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   hwinfo -short >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "List PCI - lspci" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lspci >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "List SCSI - lsscsi" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lsscsi >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "List USB - lsusb" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lsusb >> $myoutfile
   echo " " >> $myoutfile

   # Banner Info
   echo "###################################" >> $myoutfile
   echo "4 - Banner Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Banners..."

   # Check /etc/issue
   if [ -f /etc/issue ]; then
       echo "/etc/issue exists"
       # Get/etc/issue
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/issue:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/issue >> $myoutfile
   else 
      echo "/etc/issue does not exist"
      echo "/etc/issue does not exist" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # Check /etc/issue.net
   if [ -f /etc/issue.net ]; then
       echo "/etc/issue.net exists"
       # Get/etc/issue.net
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/issue.net:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/issue.net >> $myoutfile
   else 
      echo "/etc/issue.net does not exist"
      echo "/etc/issue.net does not exist" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # Check /etc/motd
   if [ -f /etc/motd ]; then
       echo "/etc/motd exists"
       # Get /etc/motd
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/motd:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/motd >> $myoutfile
   else 
      echo "/etc/motd does not exist"
      echo "/etc/motd does not exist" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # Check /etc/motd
   if [ -f /etc/ssh/ssh_banner ]; then
       echo "/etc/ssh/ssh_banner exists"
       # Get /etc/ssh/ssh_banner
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/ssh/ssh_banner:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/ssh/ssh_banner>> $myoutfile
   else 
      echo "/etc/ssh/ssh_banner does not exist"
      echo "/etc/ssh/ssh_banner does not exist" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # Host File Info
   echo "###################################" >> $myoutfile
   echo "5 Host File Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting Hosts File..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/hosts:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/hosts >> $myoutfile
   echo " " >> $myoutfile

   # DNS Info
   echo "###################################" >> $myoutfile
   echo "6 - DNS Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting DNS Info..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/resolv.conf:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/resolv.conf >> $myoutfile
   echo " " >> $myoutfile

   # User Information
   echo "###################################" >> $myoutfile
   echo "7 - User Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/passwd | cut -d ':' -f 1 >> $myoutfile
   echo " " >> $myoutfile

   # Groups Information
   echo "###################################" >> $myoutfile
   echo "8 - Groups & Users in them" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting Groups Info..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/group:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   #cat /etc/group | cut -d ':' -f 1 >> $myoutfile
   cat /etc/group >> $myoutfile
   echo " " >> $myoutfile

   # Home Directories
   echo "###################################" >> $myoutfile
   echo "9 - Home Directories" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   dir /home >> $myoutfile
   echo " " >> $myoutfile

   # Installed Packages
   echo "###################################" >> $myoutfile
   echo "Section 10 - Installed Packages" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Listing Packages from APT" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Installed Packages from APT..."
   apt list --installed >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Listing Packages from dpkg" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Installed Packages from dpkg..."
   dpkg-query -l | less >> $myoutfile
   echo " " >> $myoutfile

   # Services Info
   echo "###################################" >> $myoutfile
   echo "Section 11 - Services" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Services" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Services Legend:" >> $myoutfile
   echo "+: the service is running" >> $myoutfile
   echo "-: the service is NOT running" >> $myoutfile 
   echo "?: the service state cannot be determined" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting Services Info..."
   service --status-all >> $myoutfile
   echo " " >> $myoutfile

   # Open Ports
   echo "###################################" >> $myoutfile
   echo "Section 12- Open Ports" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Open Ports" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Open Ports..."
   ss -ltnp >> $myoutfile
   # netstat –tuln >> $myoutfile
   echo " " >> $myoutfile

   # Cron Info
   echo "###################################" >> $myoutfile
   echo "Section 13 - Cron Jobs" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Daily Cron Jobs" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Cron Daily..."
   ls -la /etc/cron.daily >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Weekly Cron Jobs" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Cron Weekly..."
   ls -la /etc/cron.weekly >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Monthly Cron Jobs" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile 
   echo "Getting Cron Monthly..."
   ls -la /etc/cron.monthly >> $myoutfile
   echo " " >> $myoutfile

   # Firewall Info
   echo "###################################" >> $myoutfile
   echo "14 - Firewall Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Firewalls..."
   echo "Checking for UFW..."
   if [[ `which ufw` ]]; then
       #Check for Ufw
       echo "UFW is installed" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "UFW Rules" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       ufw status verbose >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "UFW App List" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       ufw app list >> $myoutfile
       echo " " >> $myoutfile

   else
   	echo "UfW is not installed"
	echo "UfW is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

   echo "Checking for Firewalld..."
   if [[ `which firewalld` ]]; then
       #Check for firewalld
       echo "firewalld is installed" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "firewalld rules" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       firewall-cmd --list-all>> $myoutfile
       echo " " >> $myoutfile

   else
   	echo "firewalld is not installed"
	echo "firewalld is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi
       #Check for iptables 
       echo "Checking for iptables..."
       echo "--------------------------------" >> $myoutfile
       echo "iptables Rules" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "*** Note: If there are no rules listed, rules don't exist" >> $myoutfile
       echo " " >> $myoutfile
       iptables -L >> $myoutfile
       echo " " >> $myoutfile

   # SSH Info
   echo "###################################" >> $myoutfile
   echo "15 - SSH Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile

   # Get SSH.config
   echo "Getting SSH Config..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/ssh/sshd_config:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/ssh/sshd_config >> $myoutfile
   echo " " >> $myoutfile

   # Get SSH Parameters of Note
   echo "Getting SSH Parameters of Note..."
   echo "--------------------------------" >> $myoutfile
   echo "SSH Parameters of Note: " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "*** Note: Blank lines indicate the item is not configured" >> $myoutfile
   echo "*** Note: # in front of the line means the item is not active" >> $myoutfile
   echo " " >> $myoutfile
   echo "Allowed Users:" >> $myoutfile
   grep "AllowUsers" /etc/ssh/sshd_config >> $myoutfile
   echo "Allowed Groups:" >> $myoutfile
   grep "AllowGroups" /etc/ssh/sshd_config >> $myoutfile	
   echo "Is Root Permitted to Login:" >> $myoutfile
   grep "PermitRootLogin" /etc/ssh/sshd_config >> $myoutfile
   echo "SSH Password Authentication: (no means certificates are in use)" >> $myoutfile
   grep "PasswordAuthentication" /etc/ssh/sshd_config >> $myoutfile
   echo "Does SSH Allow empty passwords:" >> $myoutfile
   grep "PermitEmptyPasswords" /etc/ssh/sshd_config >> $myoutfile
   echo "SSH Session Time Out Values:" >> $myoutfile
   echo "Client Alive Interval:" >> $myoutfile
   grep "ClientAliveInterval" /etc/ssh/sshd_config >> $myoutfile
   echo "Client Alive Count:" >> $myoutfile
   grep "ClientAliveCountMax" /etc/ssh/sshd_config >> $myoutfile
   echo "SSH Port:" >> $myoutfile
   grep "Port" /etc/ssh/sshd_config >> $myoutfile
   echo "Address Family: (IPV4,IPV6, or Any)" >> $myoutfile
   grep "AddressFamily" /etc/ssh/sshd_config >> $myoutfile
   echo "Banner" >> $myoutfile
   grep "Banner" /etc/ssh/sshd_config >> $myoutfile
   echo " " >> $myoutfile

   # Webserver Info
   echo "###################################" >> $myoutfile
   echo "16 - Webserver Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo "*** This check looks for major web servers only (Apache2, NGNIX, lighttpd)" >> $myoutfile
   echo "*** Lesser known webservers will not be found by this check" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Major webservers only (Apache2, NGNIX, lighttpd)..."

   #Checking for Apache
   echo "Checking for Apache2..."
   if [[ `which apache2` ]]; then
       #Check for Apache
       echo "*** Apache2 is installed" >> $myoutfile
       echo "Apache2 is installed"
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Apache2 Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache Packages" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       dpkg --get-selections | grep apache >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2.conf" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/apache2.conf" >> $myoutfile
       cat /etc/apache2/apache2.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 ports configured" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/ports.conf" >> $myoutfile
       cat /etc/apache2/ports.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " Listing of Apache2 Sites Available" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " /etc/apache2/sites-available" >> $myoutfile
       ls -la /etc/apache2/sites-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 Conf Available" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/conf-available/" >> $myoutfile
       ls -la /etc/apache2/conf-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache2 Sites Enabled" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/sites-enabled/" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       ls -la /etc/apache2/sites-enabled/ >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 Conf Enabled" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/conf-enabled/" >> $myoutfile
       ls -la /etc/apache2/conf-enabled/ >> $myoutfile 
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 Mods Available" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/mods-available/" >> $myoutfile
       ls -la /etc/apache2/mods-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 Mods Enabled" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/mods-enabled/" >> $myoutfile
       ls -la /etc/apache2/mods-enabled/ >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "Apache2 is not installed"
	echo "Apache2 is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

  #Checking for Nginx
   echo "Checking for Nginx..."
   if [[ `which nginx` ]]; then
       #Check for Nginx
       echo "*** Nginx is installed" >> $myoutfile
       echo "Nginx is installed"
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Nginx Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of nginx.conf" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/nginx/nginx.conf" >> $myoutfile
       cat /etc/nginx/nginx.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of nginx Sites Available" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " /etc/nginx/sites-available" >> $myoutfile
       ls -la /etc/nginx/sites-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of nginx Sites Enabled" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/nginx/sites-enabled/" >> $myoutfile
       ls -la /etc/nginx/sites-enabled/ >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "Nginx is not installed"
	echo "*** Nginx is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

  #Checking for Lighttp
   echo "Checking for Lighttp..."
   if [[ `which lighttpd` ]]; then
       #Check for lighttpd
       echo "*** Lighttpd is installed" >> $myoutfile
       echo "Lighttpd is installed"
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Lighttpd  Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of lighttpd.conf" >> $myoutifle
       echo "--------------------------------" >> $myoutfile
       echo "/etc/lighttpd/lighttpd.conf" >> $myoutfile
       cat /etc/lighttpd/lightttp.conf >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "Lighttpd is not installed"
	echo "Lighttpd is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

   # SSL Info
   echo "###################################" >> $myoutfile
   echo "17 - SSL Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting SSL Info..."
   echo "--------------------------------" >> $myoutfile
   echo "Listing of /etc/ssl:" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   ls -R /etc/ssl >> $myoutfile

   #SMB configuration information
   echo "#################################################" >> $myoutfile
   echo "Section 18  - Samba Configuration" >> $myoutfile
   echo "#################################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking samba Config..."
   if [[ `which samba` ]]; then
       echo "samba is installed" >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "SMB Status:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       smbstatus >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/samba/smb.conf:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/samba/smb.conf >> $myoutfile
       echo " " >> $myoutfile

   else 
        echo "samba is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

   # Security Software	
   echo "#################################################" >> $myoutfile
   echo "Section 19 - App Armor, SELinux" >> $myoutfile
   echo "#################################################" >> $myoutfile
   echo " " >> $myoutfile
   # App Armor
   echo "--------------------------------" >> $myoutfile
   echo "AppArmor " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Getting App Armor Status..."
   aa-status >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "AppArmor Configuration" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Getting App Armor Configuration..."
   cat /sys/kernel/security/apparmor/profiles >> $myoutfile
   echo " " >> $myoutfile
   # SELinux
   echo "--------------------------------" >> $myoutfile
   echo "SELinux " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Key:" >> $myoutfile
   echo "Enforced: Actions contrary to the policy are blocked and the corresponding event is logged in the audit file" >> $myoutfile
   echo "Permissive: SeLinux software is loaded but rules are not enforced, only logging is performed" >> $myoutfile
   echo "Disabled: The SELinux system is disabled entirely" >> $myoutfile
   echo " " >> $myoutfile
   echo "If there is no text below the commands getenforce and sestatus were run and did not find SELinux installed." >> $myoutfile
   echo "SE Linux may be installed by running sudo apt install selinux-utils" >> $myoutfile
   echo "Getting SELinux Status..."
   echo " " >> $myoutfile
   getenforce >> $myoutfile
   echo " " >> $myoutfile 
   sestatus >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "SELinux Configuration (if installed)" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Getting SELinux Config..."    
   cat /etc/selinux/config >> $myoutfile
   echo " " >> $myoutfile

   #Syslog Info
   echo "#################################################" >> $myoutfile
   echo "Section 20  - syslog/rsyslog" >> $myoutfile
   echo "#################################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting Syslog Info..."
   echo "--------------------------------" >> $myoutfile
   echo "Syslog/RSyslog Configuration" >> $myoutfile 
   echo "--------------------------------" >> $myoutfile
   cat /etc/rsyslog.conf >> $myoutfile
   cat /etc/syslog.conf >> $myoutfile
   echo " " >> $myoutfile

   #Fail2Ban Info
     echo "#################################################" >> $myoutfile
     echo "21 - Fail2Ban Information" >> $myoutfile
     echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
     echo "Checking Fail2Ban...."
   if test -f /etc/fail2ban/jail.local; then
     echo " " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo "fail2ban config - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
     cat etc/fail2ban/jail.local >> $myoutfile
     echo " " >> $myoutfile
   else
     echo "Fail2ban not installed!" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # SNMP Information
   if test -f /etc/snmp/snmp.conf; then
     if test -f /etc/snmp/snmpd.conf; then
       echo "#################################################" >> $myoutfile
       echo "22 - SNMP Information" >> $myoutfile
       echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
       echo "Checking SNMP...."
       echo "-------------------------------------------------" >> $myoutfile
       echo "Contents of snmp.conf - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       cat /etc/snmp/snmp.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo "Contents of snmpd.conf - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       cat /etc/snmp/snmpd.conf >> $myoutfile
       echo " " >> $myoutfile
     else
       echo "#################################################" >> $myoutfile
       echo "22 - SNMP Information" >> $myoutfile
       echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo "snmp.conf located but not snmpd.conf. Contents - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       cat /etc/snmp/snmp.conf >> $myoutfile
       echo " " >> $myoutfile
     fi
   else
     if test -f /etc/snmp/snmpd.conf; then
       echo "#################################################" >> $myoutfile
       echo "22 - SNMP Information" >> $myoutfile
       echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo "snmpd.conf located but not snmp.conf. Contents - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       cat /etc/snmp/snmpd.conf >> $myoutfile
       echo " " >> $myoutfile
     else
       echo "#################################################" >> $myoutfile
       echo "22 - SNMP Information" >> $myoutfile
       echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
       echo "Neither snmp.conf nor snmpd.conf was located. Are you sure SNMP is installed?" >> $myoutfile
       echo " " >> $myoutfile
     fi
   fi  

   #Printer Information
   echo "###################################" >> $myoutfile
   echo "Section 23  - Printer Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Printers... "
   sudo lpstat -s >>$myoutfile
   echo " " >> $myoutfile

   #NFS Informaiton
   echo "###################################" >> $myoutfile
   echo "Section 28 - Local NFS Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Local NFS Information..."
   showmount -e >>$myoutfile 2>&1
   echo " " >> $myoutfile


   ########################
   # END DEBIAN CODE
   ########################

elif [[ `which yum` ]]; then
    # RedHat Based Commands go Here
   IS_RHEL=1
   echo "RedHat Based OS..."

   ########################
   # PUT Red HAT CODE HERE
   #########################

 # Hostname
   echo "###################################" >> $myoutfile
   echo "1 - Host Name" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Hostname..."
   (uname -n) >>$myoutfile
   echo " " >> $myoutfile

   # System Information
   echo "###################################" >> $myoutfile
   echo "2 - System Information " >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "OS Release" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Checking OS info..."
   echo "info from /etc/os-release.." >> $myoutfile
   cat /etc/os-release | grep -E 'ID_LIKE|NAME|VERSION_ID' |grep -v 'PRETTY_NAME' >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Kernal Information" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   # Kernal name system ,version, release, hardware Name
   echo " " >> $myoutfile
   echo "Checking Kernal name and version info..."
   uname -a >> $myoutfile
   echo " " >> $myoutfile
   #Disk Information   
   echo "--------------------------------" >> $myoutfile
   echo "Disk Information" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Disk Mount info..."
   lsblk >> $myoutfile
   echo " " >> $myoutfile
   #Disk Space  
   echo "--------------------------------" >> $myoutfile
   echo "Disk Space" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Disk Space..."
   df -H  >> $myoutfile
   echo " " >> $myoutfile
   # Mounted disks
   echo "--------------------------------" >> $myoutfile
   echo "Mounted Disks" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Disk Mountes..."
   mount | column -t >> $myoutfile
   echo " " >> $myoutfile
   # Fstab config information
   echo "--------------------------------" >> $myoutfile
   echo "Fstab" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Fstab info..."
   blkid >> $myoutfile
   echo " " >> $myoutfile
   #Network Information
   echo "--------------------------------" >> $myoutfile
   echo "Network Information" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking NW Adapter info..."
   #sudo lshw -class network -short >> $myoutfile
   ip a >> $myoutfile
   echo " " >> $myoutfile

   # Hardware Information
   echo "###################################" >> $myoutfile
   echo "3 - Hardware Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "CPU - lscpu" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lscpu >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Memory" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   free -m >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Hardware List - lshw" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lshw -short >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Hardware Info - hwinfo" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   hwinfo -short >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "List PCI - lspci" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lspci >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "List SCSI - lsscsi" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lsscsi >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "List USB - lsusb" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   lsusb >> $myoutfile
   echo " " >> $myoutfile

   # Banner Info
   echo "###################################" >> $myoutfile
   echo "4 - Banner Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Banners..."

   # Check /etc/issue
   if [ -f /etc/issue ]; then
       echo "/etc/issue exists"
       # Get/etc/issue
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/issue:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/issue >> $myoutfile
   else 
      echo "/etc/issue does not exist"
      echo "/etc/issue does not exist" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # Check /etc/issue.net
   if [ -f /etc/issue.net ]; then
       echo "/etc/issue.net exists"
       # Get/etc/issue.net
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/issue.net:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/issue.net >> $myoutfile
   else 
      echo "/etc/issue.net does not exist"
      echo "/etc/issue.net does not exist" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # Check /etc/motd
   if [ -f /etc/motd ]; then
       echo "/etc/motd exists"
       # Get /etc/motd
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/motd:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/motd >> $myoutfile
   else 
      echo "/etc/motd does not exist"
      echo "/etc/motd does not exist" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # Check /etc/motd
   if [ -f /etc/ssh/ssh_banner ]; then
       echo "/etc/ssh/ssh_banner exists"
       # Get /etc/ssh/ssh_banner
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/ssh/ssh_banner:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/ssh/ssh_banner>> $myoutfile
   else 
      echo "/etc/ssh/ssh_banner does not exist"
      echo "/etc/ssh/ssh_banner does not exist" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # Host File Info
   echo "###################################" >> $myoutfile
   echo "5 Host File Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting Hosts File..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/hosts:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/hosts >> $myoutfile
   echo " " >> $myoutfile

   # DNS Info
   echo "###################################" >> $myoutfile
   echo "6 - DNS Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting DNS Info..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/resolv.conf:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/resolv.conf >> $myoutfile
   echo " " >> $myoutfile

   # User Information
   echo "###################################" >> $myoutfile
   echo "7 - User Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/passwd | cut -d ':' -f 1 >> $myoutfile
   echo " " >> $myoutfile

   # Groups Information
   echo "###################################" >> $myoutfile
   echo "8 - Groups & Users in them" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting Groups Info..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/group:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   #cat /etc/group | cut -d ':' -f 1 >> $myoutfile
   cat /etc/group >> $myoutfile
   echo " " >> $myoutfile

   # Home Directories
   echo "###################################" >> $myoutfile
   echo "9 - Home Directories" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   dir /home >> $myoutfile
   echo " " >> $myoutfile

   # Installed Packages
   echo "###################################" >> $myoutfile
   echo "Section 10 - Installed Packages" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Listing Packages from YUM" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Installed Packages from YUM..."
   sudo yum list --installed >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Listing Packages from DNF" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Installed Packages from DNF..."
   dnf list installed >> $myoutfile
   echo " " >> $myoutfile

   # Services Info
   echo "###################################" >> $myoutfile
   echo "Section 11 - Services" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Services" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Services Legend:" >> $myoutfile
   echo "Enabled: the service is explicitly installed" >> $myoutfile
   echo "Disabled: the service is NOT installed" >> $myoutfile 
   echo "Static: the service is installed as a dependency" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting Services Info..."
   systemctl list-unit-files >> $myoutfile
   echo " " >> $myoutfile

   # Open Ports
   echo "###################################" >> $myoutfile
   echo "Section 12- Open Ports" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Open Ports" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Open Ports using lsof"
   sudo lsof -i -P -n | grep LISTEN >> $myoutfile
   echo "Getting Open Ports using NetStat"
   netstat –tuln >> $myoutfile
   echo " " >> $myoutfile 

   # Cron Info
   echo "###################################" >> $myoutfile
   echo "Section 13 - Cron Jobs" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Daily Cron Jobs" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Cron Daily..."
   ls -la /etc/cron.daily >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Weekly Cron Jobs" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Getting Cron Weekly..."
   ls -la /etc/cron.weekly >> $myoutfile
   echo " " >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo "Monthly Cron Jobs" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile 
   echo "Getting Cron Monthly..."
   ls -la /etc/cron.monthly >> $myoutfile
   echo " " >> $myoutfile

   # Firewall Info
   echo "###################################" >> $myoutfile
   echo "14 - Firewall Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Firewalls..."
   echo "Checking for UFW..."
   if [[ `which ufw` ]]; then
       #Check for Ufw
       echo "UFW is installed" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "UFW Rules" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       ufw status verbose >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "UFW App List" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       ufw app list >> $myoutfile
       echo " " >> $myoutfile

   else
   	echo "UfW is not installed"
	echo "UfW is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

   echo "Checking for Firewalld..."
   if [[ `which firewalld` ]]; then
       #Check for firewalld
       echo "firewalld is installed" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "firewalld rules" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       firewall-cmd --list-all>> $myoutfile
       echo " " >> $myoutfile

   else
   	echo "firewalld is not installed"
	echo "firewalld is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi
       #Check for iptables 
       echo "Checking for iptables..."
       echo "--------------------------------" >> $myoutfile
       echo "iptables Rules" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "*** Note: If there are no rules listed, rules don't exist" >> $myoutfile
       echo " " >> $myoutfile
       iptables -L >> $myoutfile
       echo " " >> $myoutfile

   # SSH Info
   echo "###################################" >> $myoutfile
   echo "15 - SSH Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile

   # Get SSH.config
   echo "Getting SSH Config..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/ssh/sshd_config:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/ssh/sshd_config >> $myoutfile
   echo " " >> $myoutfile

   # Get SSH Parameters of Note
   echo "Getting SSH Parameters of Note..."
   echo "--------------------------------" >> $myoutfile
   echo "SSH Parameters of Note: " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "*** Note: Blank lines indicate the item is not configured" >> $myoutfile
   echo "*** Note: # in front of the line means the item is not active" >> $myoutfile
   echo " " >> $myoutfile
   echo "Allowed Users:" >> $myoutfile
   grep "AllowUsers" /etc/ssh/sshd_config >> $myoutfile
   echo "Allowed Groups:" >> $myoutfile
   grep "AllowGroups" /etc/ssh/sshd_config >> $myoutfile	
   echo "Is Root Permitted to Login:" >> $myoutfile
   grep "PermitRootLogin" /etc/ssh/sshd_config >> $myoutfile
   echo "SSH Password Authentication: (no means certificates are in use)" >> $myoutfile
   grep "PasswordAuthentication" /etc/ssh/sshd_config >> $myoutfile
   echo "Does SSH Allow empty passwords:" >> $myoutfile
   grep "PermitEmptyPasswords" /etc/ssh/sshd_config >> $myoutfile
   echo "SSH Session Time Out Values:" >> $myoutfile
   echo "Client Alive Interval:" >> $myoutfile
   grep "ClientAliveInterval" /etc/ssh/sshd_config >> $myoutfile
   echo "Client Alive Count:" >> $myoutfile
   grep "ClientAliveCountMax" /etc/ssh/sshd_config >> $myoutfile
   echo "SSH Port:" >> $myoutfile
   grep "Port" /etc/ssh/sshd_config >> $myoutfile
   echo "Address Family: (IPV4,IPV6, or Any)" >> $myoutfile
   grep "AddressFamily" /etc/ssh/sshd_config >> $myoutfile
   echo "Banner" >> $myoutfile
   grep "Banner" /etc/ssh/sshd_config >> $myoutfile
   echo " " >> $myoutfile

   # Webserver Info
   echo "###################################" >> $myoutfile
   echo "16 - Webserver Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo "*** This check looks for major web servers only (Apache2, NGNIX, lighttpd)" >> $myoutfile
   echo "*** Lesser known webservers will not be found by this check" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Major webservers only (Apache2, NGNIX, lighttpd)..."

   #Checking for Apache
   echo "Checking for Apache2..."
   if [[ `which apache2` ]]; then
       #Check for Apache
       echo "*** Apache2 is installed" >> $myoutfile
       echo "Apache2 is installed"
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Apache2 Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache Packages" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       dpkg --get-selections | grep apache >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2.conf" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/apache2.conf" >> $myoutfile
       cat /etc/apache2/apache2.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 ports configured" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/ports.conf" >> $myoutfile
       cat /etc/apache2/ports.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " Listing of Apache2 Sites Available" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " /etc/apache2/sites-available" >> $myoutfile
       ls -la /etc/apache2/sites-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 Conf Available" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/conf-available/" >> $myoutfile
       ls -la /etc/apache2/conf-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache2 Sites Enabled" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/sites-enabled/" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       ls -la /etc/apache2/sites-enabled/ >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 Conf Enabled" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/conf-enabled/" >> $myoutfile
       ls -la /etc/apache2/conf-enabled/ >> $myoutfile 
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 Mods Available" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/mods-available/" >> $myoutfile
       ls -la /etc/apache2/mods-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of Apache2 Mods Enabled" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/apache2/mods-enabled/" >> $myoutfile
       ls -la /etc/apache2/mods-enabled/ >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "Apache2 is not installed"
	echo "Apache2 is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

  #Checking for Nginx
   echo "Checking for Nginx..."
   if [[ `which nginx` ]]; then
       #Check for Nginx
       echo "*** Nginx is installed" >> $myoutfile
       echo "Nginx is installed"
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Nginx Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of nginx.conf" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/nginx/nginx.conf" >> $myoutfile
       cat /etc/nginx/nginx.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of nginx Sites Available" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " /etc/nginx/sites-available" >> $myoutfile
       ls -la /etc/nginx/sites-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of nginx Sites Enabled" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "/etc/nginx/sites-enabled/" >> $myoutfile
       ls -la /etc/nginx/sites-enabled/ >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "Nginx is not installed"
	echo "*** Nginx is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

  #Checking for Lighttp
   echo "Checking for Lighttp..."
   if [[ `which lighttpd` ]]; then
       #Check for lighttpd
       echo "*** Lighttpd is installed" >> $myoutfile
       echo "Lighttpd is installed"
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Lighttpd  Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Listing of lighttpd.conf" >> $myoutifle
       echo "--------------------------------" >> $myoutfile
       echo "/etc/lighttpd/lighttpd.conf" >> $myoutfile
       cat /etc/lighttpd/lightttp.conf >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "Lighttpd is not installed"
	echo "Lighttpd is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

   # SSL Info
   echo "###################################" >> $myoutfile
   echo "17 - SSL Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting SSL Info..."
   echo "--------------------------------" >> $myoutfile
   echo "Listing of /etc/ssl:" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   ls -LR /etc/ssl >> $myoutfile

   #SMB configuration information
   echo "#################################################" >> $myoutfile
   echo "Section 18  - Samba Configuration" >> $myoutfile
   echo "#################################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking samba Config..."
   if [[ `which samba` ]]; then
       echo "samba is installed" >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "SMB Status:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       smbstatus >> $myoutfile
       echo " " >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Contents of /etc/samba/smb.conf:" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       cat /etc/samba/smb.conf >> $myoutfile
       echo " " >> $myoutfile

   else 
        echo "samba is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

   # Security Software	
   echo "#################################################" >> $myoutfile
   echo "Section 19 - App Armor, SELinux" >> $myoutfile
   echo "#################################################" >> $myoutfile
   echo " " >> $myoutfile
   # App Armor
   echo "--------------------------------" >> $myoutfile
   echo "AppArmor " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Getting App Armor Status..."
   aa-status >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "AppArmor Configuration" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Getting App Armor Configuration..."
   cat /sys/kernel/security/apparmor/profiles >> $myoutfile
   echo " " >> $myoutfile
   # SELinux
   echo "--------------------------------" >> $myoutfile
   echo "SELinux " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Key:" >> $myoutfile
   echo "Enforced: Actions contrary to the policy are blocked and the corresponding event is logged in the audit file" >> $myoutfile
   echo "Permissive: SeLinux software is loaded but rules are not enforced, only logging is performed" >> $myoutfile
   echo "Disabled: The SELinux system is disabled entirely" >> $myoutfile
   echo " " >> $myoutfile
   echo "If there is no text below the commands getenforce and sestatus were run and did not find SELinux installed." >> $myoutfile
   echo "SE Linux may be installed by running sudo apt install selinux-utils" >> $myoutfile
   echo "Getting SELinux Status..."
   echo " " >> $myoutfile
   getenforce >> $myoutfile
   echo " " >> $myoutfile 
   sestatus >> $myoutfile
   echo " " >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "SELinux Configuration (if installed)" >> $myoutfile
   echo "--------------------------------" >> $myoutfile
   echo "Getting SELinux Config..."    
   cat /etc/selinux/config >> $myoutfile
   echo " " >> $myoutfile

   #Syslog Info
   echo "#################################################" >> $myoutfile
   echo "Section 20  - syslog/rsyslog" >> $myoutfile
   echo "#################################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting Syslog Info..."
   echo "--------------------------------" >> $myoutfile
   echo "Syslog/RSyslog Configuration" >> $myoutfile 
   echo "--------------------------------" >> $myoutfile
   cat /etc/rsyslog.conf >> $myoutfile
   cat /etc/syslog.conf >> $myoutfile
   echo " " >> $myoutfile

   #Fail2Ban Info
     echo "#################################################" >> $myoutfile
     echo "21 - Fail2Ban Information" >> $myoutfile
     echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
     echo "Checking Fail2Ban...."
   if test -f /etc/fail2ban/jail.local; then
     echo " " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo "fail2ban config - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
     cat etc/fail2ban/jail.local >> $myoutfile
     echo " " >> $myoutfile
   else
     echo "Fail2ban not installed!" >> $myoutfile
   fi
   echo " " >> $myoutfile

   # SNMP Information
   if test -f /etc/snmp/snmp.conf; then
     if test -f /etc/snmp/snmpd.conf; then
       echo "#################################################" >> $myoutfile
       echo "22 - SNMP Information" >> $myoutfile
       echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
       echo "Checking SNMP...."
       echo "-------------------------------------------------" >> $myoutfile
       echo "Contents of snmp.conf - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       cat /etc/snmp/snmp.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo "Contents of snmpd.conf - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       cat /etc/snmp/snmpd.conf >> $myoutfile
       echo " " >> $myoutfile
     else
       echo "#################################################" >> $myoutfile
       echo "22 - SNMP Information" >> $myoutfile
       echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo "snmp.conf located but not snmpd.conf. Contents - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       cat /etc/snmp/snmp.conf >> $myoutfile
       echo " " >> $myoutfile
     fi
   else
     if test -f /etc/snmp/snmpd.conf; then
       echo "#################################################" >> $myoutfile
       echo "22 - SNMP Information" >> $myoutfile
       echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo "snmpd.conf located but not snmp.conf. Contents - " >> $myoutfile
       echo "-------------------------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       cat /etc/snmp/snmpd.conf >> $myoutfile
       echo " " >> $myoutfile
     else
       echo "#################################################" >> $myoutfile
       echo "22 - SNMP Information" >> $myoutfile
       echo "#################################################" >> $myoutfile
       echo " " >> $myoutfile
       echo "Neither snmp.conf nor snmpd.conf was located. Are you sure SNMP is installed?" >> $myoutfile
       echo " " >> $myoutfile
     fi
   fi  

   #Printer Information
   echo "###################################" >> $myoutfile
   echo "Section 23  - Printer Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Printers... "
   sudo lpstat -s >>$myoutfile
   echo " " >> $myoutfile

   #NFS Informaiton
   echo "###################################" >> $myoutfile
   echo "Section 28 - Local NFS Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking Local NFS Information..."
   showmount -e >>$myoutfile 2>&1
   echo " " >> $myoutfile


   ########################
   # END Red HAT CODE
   ########################

   echo "THE CURRENT VERSION OF LINUX IS UNSUPPORTED BY THIS TOOL"

elif [[ `which apk` ]]; then
    #Alpine Based Commands go Here
   IS_ALPINE=1
   echo "APK Based OS Most Likely Alpine Linux"
   echo "THE CURRENT VERSION OF LINUX IS UNSUPPORTED BY THIS TOOL"

else
   IS_UNKNOWN=1
   echo "Unknown OS"
   echo "THE CURRENT VERSION OF LINUX IS UNSUPPORTED BY THIS TOOL"

fi

echo "Completed running Linux Blueprint on $HOSTNAME"
echo "The report has been exported to the current working directory $myoutfile"