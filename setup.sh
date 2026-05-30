#!/bin/bash

# Instala y configura dnsmasq como servidor DNS local
sudo apt install dnsmasq -y

# Desactiva systemd-resolved para liberar el puerto 53
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved

# Configura dnsmasq para resolver los dominios del proyecto
sudo tee /etc/dnsmasq.d/lovestonedgirls.conf > /dev/null << EOF
address=/lovestonedgirls.daw/127.0.0.1
address=/admin.lovestonedgirls.daw/127.0.0.1
address=/api.lovestonedgirls.daw/127.0.0.1
EOF

# Configura el sistema para usar dnsmasq como DNS
echo "nameserver 127.0.0.1" | sudo tee /etc/resolv.conf > /dev/null

# Arranca dnsmasq
sudo systemctl enable dnsmasq
sudo systemctl restart dnsmasq

echo "Servidor DNS configurado correctamente"
echo "Comprobando resolución de dominios..."
nslookup lovestonedgirls.daw 127.0.0.1 | grep "Address:" | tail -1
