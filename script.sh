#!/bin/bash

#Submenu
function submenu(){
    opcion=$1
    selec=""
    while [[ $selec != "6" ]]; do
        echo "Usted está en la sección $2, seleccione la opción que desea utilizar.
            1. Agregar información
            2. Buscar
            3. Eliminar información
            4. Leer base de información
            5. Regresar al menu principal
            6. Salir"
        read -p "Su opcion: " selec

        case $selec in
            1 )
                agregar_info "$opcion"
            ;;
            2 )
                buscar "$opcion"
            ;;
            3 )
                eliminar "$opcion"
            ;;
            4 )
                leer_base "$opcion"
            ;;
            5 )
                echo "Regresando..."
                return 0
            ;;
            6 )
                echo "Nos vemos"
                exit 0;
            ;;
            * )
                echo "Opcion invalida"
            ;;
        esac 
    done
}

function agregar_info() {
    archivo="inf/${1}.inf"

    if [[ ! -f "$archivo" ]]; then
        echo "El archivo '$archivo' no existe."
        return 1
    fi

    read -p "Ingrese el nombre del concepto: " nombre

    if grep -iq "^\[$nombre\]" "$archivo"; then
        echo "El concepto '$nombre' ya existe."
        return 1
    fi

    read -p "Ingrese la definición del concepto '$nombre': " definicion

    echo "[$nombre] .- $definicion" >> "$archivo"
    echo "Concepto '$nombre' agregado correctamente al archivo '$archivo'."
}

function buscar() {
    archivo="inf/${1}.inf"

    if [[ ! -f "$archivo" ]]; then
        echo "El archivo '$archivo' no existe."
        return 1
    fi
    
    read -p "Ingrese el concepto que desea buscar: " concepto
    
    if grep -iq "^\[$concepto\]" "$archivo"; then
        grep -i "^\[$concepto\]" "$archivo"
    else
        echo "No se encontró el concepto '$concepto'."
    fi
}

function eliminar() {
    archivo="inf/${1}.inf"

    if [[ ! -f "$archivo" ]]; then
        echo "El archivo '$archivo' no existe."
        return 1
    fi

    read -p "Ingrese el concepto que desea eliminar: " concepto

    if grep -iq "^\[$concepto\]" "$archivo"; then
        sed -i "/^\[$concepto\]/Id" "$archivo"
        echo "El concepto '$concepto' ha sido eliminado."
    else
        echo "El concepto '$concepto' no existe en el archivo."
    fi

}

function leer_base() {
    archivo="inf/${1}.inf"

    if [[ ! -f "$archivo" ]]; then
        echo "El archivo '$archivo' no existe."
        return 1
    fi

    cat "$archivo"
}

#Menu principal
case $1 in 
	-a )    
        while true; do
            opa=""
            echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:
            *SCRUM
            *XP (Programación Extrema)
            *Kanban
            *Crystal
            *Salir (escriba 'x')"
            read -p "Ingrese una opcion (escriba el nombre): " opa
            opa=$(echo "$opa" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
            case $opa in 
                scrum )
                    nomOpa="SCRUM"
                    submenu "$opa" "$nomOpa"
                ;;
                xp|programacionextrema )
                    nomOpa="XP (Programacion Extrema)"
                    submenu "xp" "$nomOpa"
                ;;
                kanba )
                    nomOpa="Kanba"
                    submenu "$opa" "$nomOpa"
                ;;
                crystal )
                    nomOpa="Crystal"
                    submenu "$opa" "$nomOpa"
                ;;
                x )
                    exit 0;
                ;;
                * )
                    echo "Opcion invalida"
                ;;
            esac
        done
	;;
	-t )
        while true; do
            opt=""
            echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:
            *Cascada
            *Espiral
            *Modelo V
            *Salir (escriba 'x')"
            read -p "Ingrese una opcion (escriba el nombre): " opt
            nomOpt=$opt
            opt=$(echo "$opt" | tr '[:upper:]' '[:lower:]' | tr -d ' ')
            case $opt in 
                cascada )
                    nomOpt="Cascada"
                    submenu "$opt" "$nomOpt"
                ;;
                espiral )
                    nomOpt="Espiral"
                    submenu "$opt" "$nomOpt"
                ;;
                modelov )
                    nomOpt="Modelo V"
                    submenu "$opt" "$nomOpt"
                ;;
                x )
                    exit 0;
                ;;
                * )
                    echo "Opcion invalida"
                ;;
            esac
        done
	;;
	*)
		echo "No entiendo lo que dices"
	;;
esac