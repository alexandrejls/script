#!/bin/bash
# Link do material de apoio do script: https://www.asterisksounds.org/pt-br/instalar
# Script de conversão de formatados de audio do Asterisk, utilizando o software sox

#Criação do Laço de Loop para localizar todos os arquivos com extensão *.sln16
for a in $(find . -name '*.sln16'); do
  #Convertendo os arquivo com extensão *.sln16 para *.gsm
  sox -t raw -e signed-integer -b 16 -c 1 -r 16k $a -t gsm -r 8k `echo $a|sed "s/.sln16/.gsm/"`;\
  #Convertendo os arquivo com extensão *.sln16 para *.alaw
  sox -t raw -e signed-integer -b 16 -c 1 -r 16k $a -t raw -r 8k -e a-law `echo $a|sed "s/.sln16/.alaw/"`;\
  #Convertendo os arquivo com extensão *.sln16 para *.ulaw
  sox -t raw -e signed-integer -b 16 -c 1 -r 16k $a -t raw -r 8k -e mu-law `echo $a|sed "s/.sln16/.ulaw/"`;\
done
#Fim do script
