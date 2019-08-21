#!/bin/sh
host=$1
nomeutente=$2
password=$3

echo ${nomeutente}
echo ${password}
echo ${host}



if [ -d /etc/enigma2/xc ]; then
    rm -r /etc/enigma2/xc
else
    echo "  non esiste la cartella ";
fi

    

wget -O /var/volatile/tmp/xcplugin.ipk "http://venuscs.net/paneladdons/Pluginsoe20/multimedia/enigma2-plugin-extensions-xcplugin-lite_2.1_all.ipk" && chmod 777 /var/volatile/tmp/xcplugin.ipk && opkg install /var/volatile/tmp/xcplugin.ipk && touch /etc/enigma2/iptv.sh && chmod 777 /etc/enigma2/iptv.sh && wget -O /etc/enigma2/iptv.sh "http://"${host}"/get.php?username="${nomeutente}"&password="${password}"&type=enigma22_script&output=ts" && /etc/enigma2/iptv.sh && echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>
<items>
<plugin_version>1.0</plugin_version>                              
<xtream_e2portal_url><![CDATA[http://"${host}"/enigma2.php]]></xtream_e2portal_url>
<!--Edit Username and Password with your login:password -->
<username>"${nomeutente}"</username>
<password>"${password}"</password>

</items>" >> /etc/enigma2/xc/xc_e2_plugin.xml && chmod 777 /etc/enigma2/xc/xc_e2_plugin.xml

exit

