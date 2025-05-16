#!/bin/bash
    apt update && sudo apt upgrade -y
    echo "Este es un mensaje" > ~/mensaje.txt
    apt install apache2 -y
    systemctl enable apache2.service
    systemctl start apache2.service
    
