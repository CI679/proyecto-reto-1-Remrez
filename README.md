# Proyecto del primer parcial

Una aplicación en Bash que permite explorar y gestionar información sobre metodologías ágiles (SCRUM, XP, Kanban, Crystal) y tradicionales (Cascada, Espiral, Modelo V). Incluye funciones para agregar, buscar, eliminar y visualizar conceptos, empaquetada en Docker para fácil despliegue.

## Getting Started

Estas instrucciones le permitirán disponer de una copia del proyecto en su equipo local con fines de desarrollo y prueba. Ver despliegue para notas sobre cómo desplegar el proyecto en un sistema en vivo.

### Prerequisites

Qué cosas necesita para instalar el software y cómo instalarlas

```
 #Instalar Docker en Ubuntu
 sudo apt update && sudo apt install docker.io -y
```

### Installing

Instrucciones:

* 1. Clonar el repositorio

```
git clone git@github.com:CI679/proyecto-reto-1-Remrez.git
```

* 2. Construir la imagen

```
docker build -t proyecto-reto .
```

* 3. Ejecutar el contenedor (paramento -t metodologías tradicionales y -a metodologías ágiles)

```
docker run -it proyecto-reto -t

docker run -it proyecto-reto -a
```

* 4. Menú que se debe mostrar según el parámetro ingresado

```
 # -t
Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:
            *Cascada
            *Espiral
            *Modelo V
            *Salir (escriba 'x')
Ingrese una opcion (escriba el nombre): 

 # -a
Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:
            *SCRUM
            *XP (Programación Extrema)
            *Kanban
            *Crystal
            *Salir (escriba 'x')
Ingrese una opcion (escriba el nombre): 
```

## Built With

* [Bash] - Lenguaje principal para la lógica de la aplicación.
* [Docker] - Empaquetado y distribución.
* [GNU/Linux] - Entorno de desarrollo recomendado.

## Versioning

Utilizamos [SemVer](http://semver.org/) para el versionado. Para ver las versiones disponibles, consulta los [tags on this repository](https://github.com/CI679/proyecto-reto-1-Remrez/tags) 

## Authors

* **Hernández Hernández Luisa Fernanda** - *368068* - [LuFer25](https://github.com/LuFer25)
* **Ledezma Diaz Ana Sofia** - ** [anaLedezma7](https://github.com/anaLedezma7)
* **Moreno Reza Ana Rebeca** - ** [Remrez](https://github.com/Remrez)
* **Pérez González David Alejandro** - *367759* - [David-1220](https://github.com/David-1220)
* **Torres Alanís Evelyn Oyuky** - *367868* [a367868](https://github.com/a367868)

## License

Este proyecto está bajo la licencia MIT. Para más detalles, consulta el archivo [LICENSE.md](LICENSE.md)

## Acknowledgments

* Agradecimientos a la comunidad de Docker por las herramientas.
