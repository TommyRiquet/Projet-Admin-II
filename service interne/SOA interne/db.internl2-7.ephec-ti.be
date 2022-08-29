$TTL 86400 ; 1 day
$ORIGIN internl2-7.ephec-ti.be.; SOA

@           IN      SOA     ns.internl2-7.ephec-ti.be.     admin.l2-7.ephec-ti.be. (
                                    2017060101  ; serial
                                    86400       ; refesh (1 day)
                                    3600        ; retry (1 hour)
                                    3600000     ; expire (41 days)
                                    3600        ; minimun (1 hour)
)
@           IN      NS      ns.l2-7.ephec-ti.be.
            
ns              IN      A        172.17.0.5
resolv          IN      A        172.17.0.7
file            IN      A        172.17.0.6

