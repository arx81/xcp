#!/bin/sh
host=$1
nomeutente=$2
password=$3

echo ${nomeutente}
echo ${password}
echo ${host}


wget -O /var/volatile/tmp/e2m3u2bouquet.ipk "https://github.com/su1s/e2m3u2bouquet/releases/download/v0.8.2/enigma2-plugin-extensions-e2m3u2bouquet_0.8.2_all.ipk" && chmod 777 /var/volatile/tmp/e2m3u2bouquet.ipk && opkg install /var/volatile/tmp/e2m3u2bouquet.ipk && mkdir -p /etc/enigma2/e2m3u2bouquet/ && echo "<config>
  <supplier>
    <name>SOCIETY</name><!-- Supplier Name -->
    <enabled>1</enabled><!-- Enable or disable the supplier (0 or 1) -->
    <settingslevel>expert</settingslevel>
    <m3uurl><![CDATA[http://society.zapto.org:25461/get.php?username="${nomeutente}"&password="${password}"&type=m3u_plus&output=ts]]></m3uurl><!-- Extended M3U url --> 
    <epgurl><![CDATA[http://society.zapto.org:25461xmltv.php?username="${nomeutente}"&password="${password}"]]></epgurl><!-- XMLTV EPG url -->
    <username><![CDATA["${nomeutente}"]]></username><!-- (Optional) will replace USERNAME placeholder in urls -->
    <password><![CDATA["${password}"]]></password><!-- (Optional) will replace PASSWORD placeholder in urls -->
    <providerupdate><![CDATA[]]></providerupdate><!-- (Optional) Provider update url -->
    <iptvtypes>1</iptvtypes><!-- Change all TV streams to IPTV type (0 or 1) -->
    <streamtypetv>4097</streamtypetv><!-- (Optional) Custom TV stream type (e.g. 1, 4097, 5001 or 5002 -->
    <streamtypevod>4097</streamtypevod><!-- (Optional) Custom VOD stream type (e.g. 4097, 5001 or 5002 -->
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
