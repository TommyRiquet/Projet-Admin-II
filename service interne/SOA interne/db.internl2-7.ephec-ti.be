$TTL 86400 ; 1 day
$ORIGIN l2-7.ephec-ti.be.; SOA

@           IN      SOA     ns.internl2-7.ephec-ti.be.     admin.l2-7.ephec-ti.be. (
                                    2017060101  ; serial
                                    86400       ; refesh (1 day)
                                    3600        ; retry (1 hour)
                                    3600000     ; expire (41 days)
                                    3600        ; minimun (1 hour)
)
@           IN      NS      ns.l2-7.ephec-ti.be.
            MX      10      mail
            
ns              IN      A        176.96.231.192
resolv          IN      A        176.96.231.192
file            IN      A        176.96.231.192
voip            IN      A        176.96.231.192
_sip._tcp	86400	IN	   SRV	  10	  100	  5060	  voip.internl2-7.ephec-ti.be.
_sip._udp	86400	IN	   SRV	  10	  100	  5060	  voip.internl2-7.ephec-ti.be.
