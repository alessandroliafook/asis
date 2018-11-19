#!/bin/bash

while [ 1 ]; 
    do
        read -p "usuario@maquina: $PWD$ " CMD;
        time --output=log -a $CMD;
    done