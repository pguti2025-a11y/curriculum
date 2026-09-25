#!/bin/bash

read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

echo "Operaciones disponibles:"
echo "  + : Suma"
echo "  - : Resta"
echo "  * : Multiplicación"
echo "  / : División"
echo "  ^ : Potencia"
read -p "Elige la operación: " operacion

case $operacion in
    +)
        resultado=$((num1 + num2))
        echo "El resultado de '$num1' '$operacion' '$num2' es '$resultado'"
        ;;
    -)
        resultado=$((num1 - num2))
        echo "El resultado de '$num1' '$operacion' '$num2' es '$resultado'"
        ;;
    \*)
        resultado=$((num1 * num2))
        echo "El resultado de '$num1' '$operacion' '$num2' es '$resultado'"
        ;;
    /)
        if [ "$num2" -eq 0 ]
        then
            echo "Error: No se puede dividir entre cero"
        else
            resultado=$((num1 / num2))
            echo "El resultado de '$num1' '$operacion' '$num2' es '$resultado'"
        fi
        ;;
    ^)
        resultado=$(($num1 ** $num2))
        echo "El resultado de '$num1' '$operacion' '$num2' es '$resultado'"
        ;;
    *)
        echo "Error: Operación no válida"
        ;;
esac