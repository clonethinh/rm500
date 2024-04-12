#!/bin/sh

install_simple_admin() {
    while true; do
	echo -e "\e[1;32mWhat version of Simple Admin do you want to install? This will start a webserver on port 8080\e[0m"
        echo -e "\e[1;32m1) Stable current version, (Main Branch)\e[0m"
	echo -e "\e[1;31m2) Install Test Build (Development Branch)\e[0m"
    echo -e "\e[1;31m3) Install Test Build (SimpleAdmin 2)\e[0m"
	echo -e "\e[0;33m4) Return to Main Menu\e[0m"
 	echo -e "\e[1;32mSelect your choice: \e[0m"
        read choice

        case $choice in
            1)
		echo -e "\e[1;32mInstalling simpleadmin from the main stable branch\e[0m"
  		install_update_at_socat
  		sleep 1
		install_simple_firewall
  		sleep 1
                remount_rw
		sleep 1
		mkdir $SIMPLE_ADMIN_DIR
  		mkdir $SIMPLE_ADMIN_DIR/systemd
    		mkdir $SIMPLE_ADMIN_DIR/scripts
      		mkdir $SIMPLE_ADMIN_DIR/www
		mkdir $SIMPLE_ADMIN_DIR/www/cgi-bin
  		mkdir $SIMPLE_ADMIN_DIR/www/css
    		mkdir $SIMPLE_ADMIN_DIR/www/js
                cd $SIMPLE_ADMIN_DIR/systemd
                wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/systemd/simpleadmin_generate_status.service
		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/systemd/simpleadmin_httpd.service
  		sleep 1
  		cd $SIMPLE_ADMIN_DIR/scripts
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/scripts/build_modem_status
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/scripts/modemstatus_parse.sh
      		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/scripts/tojson.sh
		sleep 1
		cd $SIMPLE_ADMIN_DIR/www
		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/atcommander.html
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/index.html
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/speedtest.html
      		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/styles.css
		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/ttl.html
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/bandlock.html
  		sleep 1
  		cd $SIMPLE_ADMIN_DIR/www/js
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/js/alpinejs.min.js
    		sleep 1
    		cd $SIMPLE_ADMIN_DIR/www/css
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/css/admin.css
      		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/css/bulma.css
		sleep 1
		cd $SIMPLE_ADMIN_DIR/www/cgi-bin
		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/cgi-bin/get_atcommand
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/cgi-bin/get_csq
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/cgi-bin/get_ttl_status
      		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/main/simpleadmin/www/cgi-bin/set_ttl
		sleep 1
  		cd /
                chmod +x $SIMPLE_ADMIN_DIR/scripts/*
                chmod +x $SIMPLE_ADMIN_DIR/www/cgi-bin/*
                cp -rf $SIMPLE_ADMIN_DIR/systemd/* /lib/systemd/system
                systemctl daemon-reload
		sleep 1
                ln -sf /lib/systemd/system/simpleadmin_httpd.service /lib/systemd/system/multi-user.target.wants/
                ln -sf /lib/systemd/system/simpleadmin_generate_status.service /lib/systemd/system/multi-user.target.wants/
                systemctl start simpleadmin_generate_status
		sleep 1
                systemctl start simpleadmin_httpd
                remount_ro
                echo -e "\e[1;32msimpleadmin has been installed and is now ready for use!\e[0m"
                break
                ;;
            2)
		echo -e "\e[1;31m2) Installing simpleadmin from the development test branch\e[0m"
  		install_update_at_socat
  		sleep 1
		install_simple_firewall
  		sleep 1
                remount_rw
		sleep 1
		mkdir $SIMPLE_ADMIN_DIR
  		mkdir $SIMPLE_ADMIN_DIR/systemd
    		mkdir $SIMPLE_ADMIN_DIR/scripts
      		mkdir $SIMPLE_ADMIN_DIR/www
		mkdir $SIMPLE_ADMIN_DIR/www/cgi-bin
  		mkdir $SIMPLE_ADMIN_DIR/www/css
    		mkdir $SIMPLE_ADMIN_DIR/www/js
                cd $SIMPLE_ADMIN_DIR/systemd
                wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/systemd/simpleadmin_generate_status.service
		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/systemd/simpleadmin_httpd.service
  		sleep 1
  		cd $SIMPLE_ADMIN_DIR/scripts
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/scripts/build_modem_status
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/scripts/modemstatus_parse.sh
      		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/scripts/tojson.sh
		sleep 1
		cd $SIMPLE_ADMIN_DIR/www
		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/atcommander.html
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/index.html
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/speedtest.html
      		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/styles.css
		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/ttl.html
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/sms.html
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/bandlock.html
  		sleep 1
  		cd $SIMPLE_ADMIN_DIR/www/js
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/js/alpinejs.min.js
    		sleep 1
    		cd $SIMPLE_ADMIN_DIR/www/css
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/css/admin.css
      		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/css/bulma.css
		sleep 1
		cd $SIMPLE_ADMIN_DIR/www/cgi-bin
		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/cgi-bin/get_atcommand
  		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/cgi-bin/get_csq
    		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/cgi-bin/get_ttl_status
      		wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/cgi-bin/set_ttl
	 	wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/www/cgi-bin/get_sms
		sleep 1
  		cd /
                chmod +x $SIMPLE_ADMIN_DIR/scripts/*
                chmod +x $SIMPLE_ADMIN_DIR/www/cgi-bin/*
                cp -rf $SIMPLE_ADMIN_DIR/systemd/* /lib/systemd/system
                systemctl daemon-reload
		sleep 1
                ln -sf /lib/systemd/system/simpleadmin_httpd.service /lib/systemd/system/multi-user.target.wants/
                ln -sf /lib/systemd/system/simpleadmin_generate_status.service /lib/systemd/system/multi-user.target.wants/
                systemctl start simpleadmin_generate_status
		sleep 1
                systemctl start simpleadmin_httpd
                remount_ro
                echo -e "\e[1;32msimpleadmin has been installed and is now ready for use!\e[0m"
                break
                ;;
        3)
        echo -e "\e[1;31m3) Installing simpleadmin 2 from\e[0m"
        install_update_at_socat
        sleep 1
        install_simple_firewall
        sleep 1
                remount_rw
        sleep 1
        mkdir $SIMPLE_ADMIN_DIR
        mkdir $SIMPLE_ADMIN_DIR/systemd
        mkdir $SIMPLE_ADMIN_DIR/www
        mkdir $SIMPLE_ADMIN_DIR/www/cgi-bin
        mkdir $SIMPLE_ADMIN_DIR/www/css
        mkdir $SIMPLE_ADMIN_DIR/www/js
        cd $SIMPLE_ADMIN_DIR/systemd
        wget https://raw.githubusercontent.com/$GITUSER/quectel-rgmii-toolkit/development/simpleadmin/systemd/simpleadmin_httpd.service
        sleep 1
        cd $SIMPLE_ADMIN_DIR/www
        wget https://binhi.wvsu.edu.ph/simpleadmin/index.html
        wget https://binhi.wvsu.edu.ph/simpleadmin/deviceinfo.html
        wget https://binhi.wvsu.edu.ph/simpleadmin/network.html
        wget https://binhi.wvsu.edu.ph/simpleadmin/sms.html
        wget https://binhi.wvsu.edu.ph/simpleadmin/settings.html
        sleep 1
        sed -i 's/\r//' index.html
        sed -i 's/\r//' deviceinfo.html
        sed -i 's/\r//' network.html
        sed -i 's/\r//' sms.html
        sed -i 's/\r//' settings.html
        sleep 1
        cd $SIMPLE_ADMIN_DIR/www/js
        wget https://binhi.wvsu.edu.ph/simpleadmin/js/alpinejs.min.js
        wget https://binhi.wvsu.edu.ph/simpleadmin/js/band-locking.js
        wget https://binhi.wvsu.edu.ph/simpleadmin/js/bootstrap.bundle.min.js
        wget https://binhi.wvsu.edu.ph/simpleadmin/js/dark-mode.js
        wget https://binhi.wvsu.edu.ph/simpleadmin/js/extract-bw.js
        wget https://binhi.wvsu.edu.ph/simpleadmin/js/generate-freq-box.js
        wget https://binhi.wvsu.edu.ph/simpleadmin/js/parse-settings.js
        wget https://binhi.wvsu.edu.ph/simpleadmin/js/populate-checkbox.js
        sleep 1
        sed -i 's/\r//' alpinejs.min.js
        sed -i 's/\r//' band-locking.js
        sed -i 's/\r//' bootstrap.bundle.min.js
        sed -i 's/\r//' dark-mode.js
        sed -i 's/\r//' extract-bw.js
        sed -i 's/\r//' generate-freq-box.js
        sed -i 's/\r//' parse-settings.js
        sed -i 's/\r//' populate-checkbox.js
        sleep 1
        cd $SIMPLE_ADMIN_DIR/www/css
        wget https://binhi.wvsu.edu.ph/simpleadmin/css/bootstrap.min.css
        wget https://binhi.wvsu.edu.ph/simpleadmin/css/styles.css
        sleep 1
        cd $SIMPLE_ADMIN_DIR/www/cgi-bin
        wget https://binhi.wvsu.edu.ph/simpleadmin/cgi-bin/get_atcommand
        wget https://binhi.wvsu.edu.ph/simpleadmin/cgi-bin/get_ping
        wget https://binhi.wvsu.edu.ph/simpleadmin/cgi-bin/get_sms
        wget https://binhi.wvsu.edu.ph/simpleadmin/cgi-bin/get_ttl_status
        wget https://binhi.wvsu.edu.ph/simpleadmin/cgi-bin/set_ttl
        sleep 1
        sed -i 's/\r//' get_atcommand
        sed -i 's/\r//' get_ping
        sed -i 's/\r//' get_sms
        sed -i 's/\r//' get_ttl_status
        sed -i 's/\r//' set_ttl
        sleep 1

        cd /
        chmod +x $SIMPLE_ADMIN_DIR/www/cgi-bin/*
        cp -rf $SIMPLE_ADMIN_DIR/systemd/* /lib/systemd/system
        systemctl daemon-reload
        sleep 1

        ln -sf /lib/systemd/system/simpleadmin_httpd.service /lib/systemd/system/multi-user.target.wants/
        sleep 1
        systemctl start simpleadmin_httpd
        remount_ro
        echo -e "\e[1;32mSimpleadmin 2 has been installed and is now ready for use!\e[0m"
        break
        ;;

	    4)
                echo "Returning to main menu..."
                break
                ;;
            *)
                echo "Invalid choice. Please try again."
                ;;
        esac
    done
}
