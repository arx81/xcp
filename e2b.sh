#!/bin/sh
host=$1
nomeutente=$2
password=$3

echo ${nomeutente}
echo ${password}
echo ${host}



mkdir -p /etc/enigma2/e2m3u2bouquet/ && 
wget -O /home/e2m3u2bouquet.ipk "https://github.com/su1s/e2m3u2bouquet/releases/download/v0.8.2/enigma2-plugin-extensions-e2m3u2bouquet_0.8.2_all.ipk" 
&& chmod 777 /home/e2m3u2bouquet.ipk 
&& opkg install /home/e2m3u2bouquet.ipk   
&& wget -O /etc/enigma2/iptv.sh "http://"${host}"/get.php?username="${nomeutente}"&password="${password}"&type=enigma22_script&output=ts" 
&& /etc/enigma2/iptv.sh 
&& echo "<config>
  <supplier>
    <name>SOCIETY</name><!-- Supplier Name -->
    <enabled>1</enabled><!-- Enable or disable the supplier (0 or 1) -->
    <settingslevel>expert</settingslevel>
    <m3uurl><![CDATA[http://"${host}"/get.php?username="${nomeutente}"&password="${password}"=m3u_plus&output=ts]]></m3uurl><!-- Extended M3U url --> 
    <epgurl><![CDATA[http://www.epgitalia.tv/xml/guide.xml]]></epgurl><!-- XMLTV EPG url -->
    <username><![CDATA[]]></username><!-- (Optional) will replace USERNAME placeholder in urls -->
    <password><![CDATA[]]></password><!-- (Optional) will replace PASSWORD placeholder in urls -->
    <providerupdate><![CDATA[]]></providerupdate><!-- (Optional) Provider update url -->
    <iptvtypes>1</iptvtypes><!-- Change all TV streams to IPTV type (0 or 1) -->
    <streamtypetv></streamtypetv><!-- (Optional) Custom TV stream type (e.g. 1, 4097, 5001 or 5002 -->
    <streamtypevod></streamtypevod><!-- (Optional) Custom VOD stream type (e.g. 4097, 5001 or 5002 -->
    <multivod>1</multivod><!-- Split VOD into seperate categories (0 or 1) -->
    <allbouquet>0</allbouquet><!-- Create all channels bouquet (0 or 1) -->
    <picons>0</picons><!-- Automatically download Picons (0 or 1) -->
    <iconpath></iconpath><!-- Location to store picons) -->
    <xcludesref>1</xcludesref><!-- Disable service ref overriding from override.xml file (0 or 1) -->
    <bouqueturl><![CDATA[]]></bouqueturl><!-- (Optional) url to download providers bouquet - to map custom service references -->
    <bouquetdownload>1</bouquetdownload><!-- Download providers bouquet (uses default url) must have username and password set above - to map custom service references -->
    <bouquettop>0</bouquettop><!-- Place IPTV bouquets at top (0 or 1) -->
    <lastproviderupdate>0</lastproviderupdate><!-- Internal use -->
  </supplier>
</config>" >> /etc/enigma2/e2m3u2bouquet/config.xml && chmod 777 /etc/enigma2/e2m3u2bouquet/config.xml

exit
