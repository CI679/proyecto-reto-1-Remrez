FROM ubuntu:22.04

# Actualiza el sistema
RUN apt update && apt install -y bash

# Crea un directorio de trabajo
WORKDIR /app

# Copia la carpeta y el script
COPY inf/ ./inf
COPY script.sh .

# Da los permisos para ejecutarse el script
RUN chmod +x script.sh

# Se usa ENTRYPOINT para que se permita usar los argumentos (-a, -t)
ENTRYPOINT ["./script.sh"]


