# O Asterisk é um software livre, de código aberto, que implementa em software os recursos encontrados em um PABX 
# convencional, utilizando tecnologia de VoIP. Ele foi criado pelo Mark Spencer em 1999.
# Inicialmente desenvolvido pela empresa Digium, hoje recebe contribuições de programadores ao redor de todo o mundo. 
# Seu desenvolvimento é ativo e sua área de aplicação muito promissora.
#
# DAHDI = DAHDI (Digium\Asterisk Hardware Device Interface) é uma coleção de drivers de código aberto, para o Linux, 
# que são usados para fazer interface com uma variedade de hardware relacionado à telefonia.
#
# DAHDI Tools = contém uma variedade de utilitários de comandos do usuário que são usados para configurar e testar os 
# drivers de hardware desenvolvidos pela Digium e Zapatel.
#
# LIBPRI = A biblioteca libpri permite que o Asterisk se comunique com conexões ISDN. Você só precisará disso se for 
# usar o DAHDI com hardware de interface ISDN (como placas T1 / E1 / J1 / BRI).
#
# iLBC = O iLBC (internet Low Bitrate Codec) é um codec de voz GRATUITO adequado para comunicação de voz robusta sobre IP. 
# O codec é projetado para fala de banda estreita e resulta em uma taxa de bits de carga útil de 13,33 kbit / s com um 
# comprimento de quadro de codificação de 30 ms e 15,20 kbps com um comprimento de codificação de 20 ms.
#
# H.323 =  é um conjunto de padrões da ITU-T que define um conjunto de protocolos para o fornecimento de comunicação de áudio 
# e vídeo numa rede de computadores. O H.323 é um protocolo relativamente antigo que está atualmente sendo substituído pelo SIP.
#
# Site Oficial do Asterisk: https://www.asterisk.org/
#
# Vídeo de instalação do GNU/Linux Ubuntu Server 18.04.x LTS: https://www.youtube.com/watch?v=zDdCrqNhIXI
#
# Variável da Data Inicial para calcular o tempo de execução do script (VARIÁVEL MELHORADA)
# opção do comando date: +%T (Time)
HORAINICIAL=`date +%T`
#
#
# Variável do caminho do Log dos Script utilizado nesse curso (VARIÁVEL MELHORADA)
# opções do comando cut: -d (delimiter), -f (fields)
# $0 (variável de ambiente do nome do comando)
LOG="/var/log/$(echo $0 | cut -d'/' -f2)"
#
# Declarando as variaveis de Download do Asterisk: http://downloads.asterisk.org/pub/telephony/
DAHDI="http://downloads.asterisk.org/pub/telephony/dahdi-linux/dahdi-linux-current.tar.gz"
#
echo -e "Download e instalação do DAHDI, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando wget: -O (file)
	wget -O dahdi-linux-current.tar.gz $DAHDI &>> $LOG
	# opção do comando tar: -z (gzip), -x (extract), -v (verbose), -f (file)
	tar -zxvf dahdi-linux-current.tar.gz &>> $LOG
	# acessando diretório do dahdi-linux
	cd dahdi-linux*/ &>> $LOG
	# preparação e configuração do source para compilação
	./configure  &>> $LOG
	# desfaz o processo de compilação anterior
	make clean  &>> $LOG
	# compila todas as opções do software
	make all  &>> $LOG
	# executa os comandos para instalar o programa
	make install  &>> $LOG
	# opção do comando cd: .. (dois pontos sequenciais - Subir uma pasta)
	cd ..
echo -e "DAHDI instalado com sucesso!!!, continuando com o script..."
sleep 5
#
DAHDITOOLS="http://downloads.asterisk.org/pub/telephony/dahdi-tools/dahdi-tools-current.tar.gz"
#
echo -e "Download e instalação do DAHDI Tools, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando wget: -O (file)
	wget -O dahdi-tools-current.tar.gz $DAHDITOOLS &>> $LOG
	# opção do comando tar: -z (gzip), -x (extract), -v (verbose), -f (file)
	tar -zxvf dahdi-tools-current.tar.gz &>> $LOG
	# acessando diretório do dahdi-tools
	cd dahdi-tools*/ &>> $LOG
	# atualize os arquivos de configuração gerados
	autoreconf -i  &>> $LOG
	# preparação e configuração do source para compilação
	./configure &>> $LOG
	# desfaz o processo de compilação anterior
	make clean  &>> $LOG
	# compila todas as opções do software
	make all  &>> $LOG
	# executa os comandos para instalar o programa
	make install  &>> $LOG
	# opção do comando cd: .. (dois pontos sequenciais - Subir uma pasta)
	cd ..
echo -e "DAHDI Tools instalado com sucesso!!!, continuando com o script..."
sleep 5
#
LIBPRI="http://downloads.asterisk.org/pub/telephony/libpri/libpri-current.tar.gz"
#
echo -e "Download e instalação do LIBPRI, aguarde..."
	# opção do comando: &>> (redirecionar a saída padrão)
	# opção do comando wget: -O (file)
	wget -O libpri-current.tar.gz $LIBPRI &>> $LOG
	# opção do comando tar: -z (gzip), -x (extract), -v (verbose), -f (file)
	tar -zxvf libpri-current.tar.gz &>> $LOG
	# acessando diretório do libpri
	cd libpri*/ &>> $LOG
	# preparação e configuração do source para compilação
	./configure &>> $LOG
	# desfaz o processo de compilação anterior
	make clean  &>> $LOG
	# compila todas as opções do software
	make all &>> $LOG
	# executa os comandos para instalar o programa
	make install &>> $LOG
	# opção do comando cd: .. (dois pontos sequenciais - Subir uma pasta)
	cd ..
echo -e "LIBPRI instalado com sucesso!!!, continuando com o script..."
sleep 5
#
ASTERISK="http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-17-current.tar.gz"
PTBRCORE="https://www.asterisksounds.org/sites/asterisksounds.org/files/sounds/pt-BR/download/asterisk-sounds-core-pt-BR-3.8.3.zip"
PTBREXTRA="https://www.asterisksounds.org/sites/asterisksounds.org/files/sounds/pt-BR/download/asterisk-sounds-extra-pt-BR-1.11.10.zip"
SOUNDS="/var/lib/asterisk/sounds/pt_BR"
COUNTRYCODE="55"
