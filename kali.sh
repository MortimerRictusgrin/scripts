#!/bin/sh

# Actualizar repositorios, sistema e instalar paquetes
sudo apt update
sudo apt upgrade -y
sudo apt install -y kali-desktop-xfce kali-tools-top10 tigervnc-standalone-server novnc

# Configurar contraseña para servidor vnc
vncpasswd

# Crear directorio
mkdir -p $HOME/.local/bin/

# Iniciar servidor VNC, inicia en puerto 5901 e iniciar el servicio NoVNC
# para acceder desde el navegador
cat <<EOF >>$HOME/.local/bin/remote.sh
vncserver -localhost yes -xstartup startxfce4 -display :1 &
/usr/share/novnc/utils/novnc_proxy --listen 8081 --vnc localhost:5901 &
sleep 3
echo "para abrir el puerto 8081 en el equipo local"
echo "ejecutar el comando: "
echo "ssh -i kali.pem -L 8081:localhost:8081 <USUARIO>@<IP>"
echo "y abrir localhost:8081 desde el navegador"
EOF

vncserver -kill :1 &
kill -9 $(lsof -t -i tcp:8081) &
sh $HOME/.local/bin/remote.sh
