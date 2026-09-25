#!/bin/bash

obtener_info_red() {
    echo "=== INFORMACIÓN DE RED ==="
    ip addr show | grep -E "inet " | grep -v "127.0.0.1" | head -1 | while read linea
    do
        ip_cidr=$(echo $linea | awk '{print $2}')
        echo "IP con CIDR: $ip_cidr"
        
        ip=$(echo $ip_cidr | cut -d/ -f1)
        mascara=$(echo $ip_cidr | cut -d/ -f2)
        echo "Dirección IP: $ip"
        echo "Máscara de subred: /$mascara"
        
        IFS=. read -r a b c d <<< "$ip"
        red="$a.$b.$c.0"
        broadcast="$a.$b.$c.255"
        echo "Red: $red"
        echo "Broadcast: $broadcast"
        echo "Tipo de red: /$mascara (CIDR)"
    done
}

escanear_ips() {
    echo ""
    echo "=== ESCANEO DE IPS ==="
    
    ip_actual=$(ip addr show | grep -E "inet " | grep -v "127.0.0.1" | head -1 | awk '{print $2}' | cut -d/ -f1)
    
    IFS=. read -r a b c d <<< "$ip_actual"
    
    for i in $(seq 1 254)
    do
        ip="$a.$b.$c.$i"
        if ping -c 1 -W 1 $ip &>/dev/null
        then
            echo "IP $ip: OCUPADA"
        else
            echo "IP $ip: LIBRE"
        fi
    done
}

obtener_info_red
escanear_ips