#!/bin/bash

##################################################################
# LinuxBlueprint.sh
# Authors: James McNabb
# 
#
# This script blueprints a linux system for system vetting needs
# 
# Usage: sudo ./LinuxBlueprint.sh
#
#
##################################################################

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


   # Write Section 1 Header
   echo "###################################" >> $myoutfile
   echo "Section 1 - Installed Packages" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile


   #Part 1 of Eric's Code
   
	echo "************************************************************" >> $myoutfile
	echo "Installed Packages" >> $myoutfile
	echo "************************************************************" >> $myoutfile
	echo "Apt List" >> $myoutfile
	echo "************************************************************" >> $myoutfile
	apt list --installed >> $myoutfile
	echo "************************************************************" >> $myoutfile
	echo "Installed Packages" >> $myoutfile
	echo "************************************************************" >> $myoutfile
	echo "Dpkg Query" >> $myoutfile
	echo "************************************************************" >> $myoutfile
	dpkg-query -l | less >> $myoutfile
	echo " " >> $myoutfile
	echo "*************************************************************************" >> $myoutfile
	echo " " >> $myoutfile
	echo "*************************************************************************" >> $myoutfile
	# Write Section Header
    echo "###################################" >> $myoutfile
    echo "Section 2 - Services, Cron Jobs, Open Ports" >> $myoutfile
    echo "###################################" >> $myoutfile
    echo " " >> $myoutfile

	echo "Services" >> $myoutfile
	echo "Services Legend:" >> $myoutfile
	echo "+: the service is running" >> $myoutfile
	echo "-: the service is NOT running" >> $myoutfile
	echo "?: the service state cannot be determined" >> $myoutfile
	echo "*************************************************************************" >> $myoutfile
	service --status-all >> $myoutfile
	echo "*************************************************************************" >> $myoutfile
	echo " " >> $myoutfile
	echo "*************************************************************************" >> $myoutfile
	echo "Open Ports" >> $myoutfile
	echo "*************************************************************************" >> $myoutfile
	netstat –tuln >> $myoutfile
	echo "*************************************************************************" >> $myoutfile
    echo " " >> $myoutfile
    echo " " >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo " " >> $myoutfile
    echo "Cron Jobs" >> $myoutfile
    echo " " >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo "Daily Cron Jobs" >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    ls -la /etc/cron.daily >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo "Weekly Cron Jobs" >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    ls -la /etc/cron.weekly >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo "Monthly Cron Jobs" >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    ls -la /etc/cron.monthly >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo " " >> $myoutfile
	
    # Part 2 of Eric's Code
	
    echo "###################################" >> $myoutfile
    echo "Section 2 - App Armor, SELinux, Syslog/rsyslog" >> $myoutfile
    echo "###################################" >> $myoutfile
    echo " " >> $myoutfile
   
    echo "!!!!!" >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo " " >> $myoutfile
    echo "AppArmor " >> $myoutfile
    echo " " >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    aa-status >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo "AppArmor Configuration" >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    cat /sys/kernel/security/apparmor/profiles >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo " " >> $myoutfile
    echo "SELinux " >> $myoutfile
    echo " " >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo "Key:" >> $myoutfile
    echo "       Enforced: Actions contrary to the policy are blocked and the corresponding event is logged in the audit file" >> $myoutfile
    echo "       Permissive: SeLinux software is loaded but rules are not enforced, only logging is performed" >> $myoutfile
    echo "       Disabled: The SELinux system is disabled entirely" >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo "If there is no text below the commands getenforce and sestatus were run and did not find SELinux installed." >> $myoutfile
    echo "SE Linux may be installed by running sudo apt install selinux-utils" >> $myoutfile
    getenforce >> $myoutfile
    echo " " >> $myoutfile 
    sestatus >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo " " >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo "SELinux Configuration (if installed)" >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    cat /etc/selinux/config >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo " " >> $myoutfile
    echo "Syslog/RSyslog Configuration" >> $myoutfile 
    echo " " >> $myoutfile  
    echo "*************************************************************************" >> $myoutfile
    cat /etc/rsyslog.conf >> $myoutfile
    cat /etc/syslog.conf >> $myoutfile
    echo "*************************************************************************" >> $myoutfile
    echo "Section 2 Header" >> $myoutfile
    echo "!!!!!" >> $myoutfile

   # End of Eric's Code

   # Write Section 2 Header
   echo "###################################" >> $myoutfile
   echo "Section 2 Header" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile

   #Section 2 Code

   # DNS Info
   echo "###################################" >> $myoutfile
   echo "DNS Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile
   echo "Getting DNS Info..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/resolv.conf:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/resolv.conf >> $myoutfile
   echo " " >> $myoutfile

   # Host File Info
   echo "###################################" >> $myoutfile
   echo "Host File Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo " " >> $myoutfile

   echo "Getting Hosts File..."
   echo "-----------------------------------" >> $myoutfile
   echo "Contents of /etc/hosts:" >> $myoutfile
   echo "-----------------------------------" >> $myoutfile
   echo " " >> $myoutfile
   cat /etc/hosts >> $myoutfile
   echo " " >> $myoutfile

   # SSH Info
   echo "###################################" >> $myoutfile
   echo "SSH Information" >> $myoutfile
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
   echo " " >> $myoutfile

   # Banner Info
   echo "###################################" >> $myoutfile
   echo "Banner Information" >> $myoutfile
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
       echo " " >> $myoutfile
   else 
      echo "/etc/issue does not exist"
      echo "/etc/issue does not exist" >> $myoutfile
      echo " " >> $myoutfile
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
       echo " " >> $myoutfile
   else 
      echo "/etc/issue.net does not exist"
      echo "/etc/issue.net does not exist" >> $myoutfile
      echo " " >> $myoutfile
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
       echo " " >> $myoutfile
   else 
      echo "/etc/motd does not exist"
      echo "/etc/motd does not exist" >> $myoutfile
      echo " " >> $myoutfile
   fi

   # Firewall Info
   echo "###################################" >> $myoutfile
   echo "Firewall Information" >> $myoutfile
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
     
       #Check for iptables 
       echo "Checking for iptables..."
       echo "Checking for iptables Rules" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "iptables Rules" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "*** Note: If there are no rules listed, rules don't exist" >> $myoutfile
       echo " " >> $myoutfile
       iptables -L >> $myoutfile
       echo " " >> $myoutfile

   # Webserver Info
   echo "###################################" >> $myoutfile
   echo "Webserver Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo "*** This check looks for major web servers only (Apache2, NGNIX, lighttpd)" >> $myoutfile
   echo "*** Lesser known webservers will not be found by this check" >> $myoutfile
   echo " " >> $myoutfile
   echo "Checking for Major webservers only (Apache2, NGNIX, lighttpd)..."

   #Checking for Apache
   echo "Checking for Apache2"
   if [[ `which apache2` ]]; then
       #Check for Apache
       echo "--------------------------------" >> $myoutfile
       echo "!!! Apache2 is installed" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Apache2 Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache Packages" >> $myoutfile
       dpkg --get-selections | grep apache >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache2.conf" >> $myoutfile
       echo "/etc/apache2/apache2.conf" >> $myoutfile
       cat /etc/apache2/apache2.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache2 ports configured" >> $myoutfile
       echo "/etc/apache2/ports.conf" >> $myoutfile
       cat /etc/apache2/ports.conf >> $myoutfile
       echo " " >> $myoutfile
       echo " Listing of Apache2 Sites Available" >> $myoutfile
       echo " /etc/apache2/sites-available" >> $myoutfile
       ls -la /etc/apache2/sites-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache2 Conf Available" >> $myoutfile
       echo "/etc/apache2/conf-available/" >> $myoutfile
     ls -la /etc/apache2/conf-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache2 Sites Enabled" >> $myoutfile
       echo "/etc/apache2/sites-enabled/" >> $myoutfile
       ls -la /etc/apache2/sites-enabled/ >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache2 Conf Enabled" >> $myoutfile
       echo "/etc/apache2/conf-enabled/" >> $myoutfile
       ls -la /etc/apache2/conf-enabled/ >> $myoutfile 
       echo " " >> $myoutfile
       echo "Listing of Apache2 Mods Available" >> $myoutfile
       echo "/etc/apache2/mods-available/" >> $myoutfile
       ls -la /etc/apache2/mods-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of Apache2 Mods Enabled" >> $myoutfile
       echo "/etc/apache2/mods-enabled/" >> $myoutfile
       ls -la /etc/apache2/mods-enabled/ >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "Apache2 is not installed"
	echo "!!! Apache2 is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

  #Checking for Nginx
   echo "Checking for Nginx"
   if [[ `which nginx` ]]; then
       #Check for Nginx
       echo "--------------------------------" >> $myoutfile
       echo "!!! Nginx is installed" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Nginx Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of nginx.conf"
       echo "/etc/nginx/nginx.conf"
       cat /etc/nginx/nginx.conf >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of nginx Sites Available" >> $myoutfile
       echo " /etc/nginx/sites-available" >> $myoutfile
       ls -la /etc/nginx/sites-available/ >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of nginx Sites Enabled" >> $myoutfile
       echo "/etc/nginx/sites-enabled/" >> $myoutfile
       ls -la /etc/nginx/sites-enabled/ >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "Nginx is not installed"
	echo "Nginx is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

  #Checking for Lighttp
   echo "Checking for Lighttp"
   if [[ `which lighttpd` ]]; then
       #Check for lighttpd
       echo "--------------------------------" >> $myoutfile
       echo "!!! Lighttpd is installed" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo "Lighttpd  Info" >> $myoutfile
       echo "--------------------------------" >> $myoutfile
       echo " " >> $myoutfile
       echo "Listing of lighttpd.conf"
       echo "/etc/lighttpd/lighttpd.conf"
       cat /etc/lighttpd/lightttp.conf >> $myoutfile
       echo " " >> $myoutfile
   else
   	echo "!!! Lighttpd is not installed"
	echo "Lighttpd is not installed" >> $myoutfile
	echo " " >> $myoutfile
   fi

   # SSL Info
   echo "###################################" >> $myoutfile
   echo "SSL Information" >> $myoutfile
   echo "###################################" >> $myoutfile
   echo "Checking SSL..."
   echo "Listing of /etc/ssl:"
   ls -R /etc/ssl >> $myoutfile
	


   ########################
   # END DEBIAN CODE
   ########################

elif [[ `which yum` ]]; then
    # RedHat Based Commands go Here
   IS_RHEL=1
   echo "RedHat Based OS"

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
echo "The report has been exported to the current working directory named $myoutfile"