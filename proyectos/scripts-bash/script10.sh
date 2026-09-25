#!/bin/bash

read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

echo "Operaciones disponibles:"
echo "  + : Suma"
echo "  - : Resta"
echo "  * : Multiplicación"
echo "  / : División"
read -p "Elige la operación: " operacion

case $operacion in
    +)
        resultado=$((num1 + num2))
        echo "$num1 + $num2 = $resultado"
        ;;
    -)
        resultado=$((num1 - num2))
        echo "$num1 - $num2 = $resultado"
        ;;
    \*)
        resultado=$((num1 * num2))
        echo "$num1 x $num2 = $resultado"
        ;;
    /)
        if [ "$num2" -eq 0 ]
        then
            echo "Error: No se puede dividir entre cero"
        else
            resultado=$((num1 / num2))
            echo "$num1 / $num2 = $resultado"
        fi
        ;;
    *)
        echo "Error: Operación no válida"
        ;;
esac