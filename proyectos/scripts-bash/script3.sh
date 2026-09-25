#!/bin/bash

read -p "Introduce el nombre de usuario a buscar: " usuario

if id "$usuario" &>/dev/null
then
    echo "El usuario $usuario está creado en el sistema y estos son sus datos:"
    echo ""
    echo "- Nombre del usuario con el que ha hecho login: $(whoami)"
    echo "- Grupos a los que pertenece: $(groups $usuario)"
    echo "- Terminal de comandos asociado: $(grep "^$usuario:" /etc/passwd | cut -d: -f7)"
else
    echo "El usuario $usuario no está creado en el sistema"
fi