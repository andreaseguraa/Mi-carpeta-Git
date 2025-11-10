#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directorio_origen> <directorio_destino>"
    exit 1
fi

DIRECTORIO_ORIGEN="$1"
DIRECTORIO_DESTINO="$2"



if [ ! -d "$DIRECTORIO_ORIGEN" ]; then
    echo "Error: El directorio de origen '$DIRECTORIO_ORIGEN' no existe."
    exit 1
fi

if 