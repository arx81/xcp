#!/bin/sh
host=$1
nomeutente=$2
password=$3

echo ${nomeutente}
echo ${password}
echo ${host}


wget -O /usr/lib/enigma2/python/Plugins/Extensions/xc2.zip http://pluginiptv.ddns.net:4373/BC/xc2.zip && unzip -o -d /usr/lib/enigma2/python/Plugins/Extensions/ /usr/lib/enigma2/python/Plugins/Extensions/xc2.zip && echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>
<items>
<plugin_version>1.0</plugin_version>                              
<xtream_e2portal_url><![CDATA[http://"${host}"/enigma2.php]]></xtream_e2portal_url>
<!--Edit Username and Password with your login:password -->
<username>"${nomeutente}"</username>
<password>"${password}"</password>
<esr_id /> 
<ar_id_start /> 
<ar_id_end /> 
<security_key />
</items>" >> /etc/enigma2/xc_e2_plugin.xml && chmod 777 /etc/enigma2/xc_e2_plugin.xml && reboot

exit
