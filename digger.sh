#!/bin/bash

domain=${1}
#whois=$(/usr/bin/whois)
#DIGGER BRABO

echo -e "DIGGER DOS LANTRA\n"
echo -e "DOMINIO $domain\n"
echo -e "TIPO A"
TIPOA=$(dig A @8.8.8.8 ${domain} +short)
echo "==================================="
echo -e "$TIPOA"
echo "==================================="
echo -e "MX, Mail e SPF"
MX=$(dig MX @8.8.8.8 ${domain} +short)
MAIL=$(dig A @8.8.8.8 mail.${domain} +short)
SPF=$(dig txt @8.8.8.8 ${domain} | grep -i 'spf')
echo "==================================="
echo -e "$MX"
echo -e "mail.${domain} IN A $MAIL"
echo -e "$SPF"
echo "==================================="
echo -e "NAMESERVER"
NS=$(dig NS @8.8.8.8 ${domain} +short)
if [[ $(echo ${NS} | grep -i 'cloudflare') ]]
	        then
			                echo -e "Dominio aponta para a CloudFlare"
					                echo "==================================="
							                echo -e "$NS"
									                echo "==================================="
											        else
													                echo "==================================="
															                echo -e "$NS"
																	                echo "==================================="

fi
#check whois
echo "STATUS DO DOMINIO ${domain}"
echo "==================================="
/usr/bin/whois ${domain} | grep -i status | grep -v 'For more'
echo "==================================="
