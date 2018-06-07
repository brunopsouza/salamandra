#Execute chmod +x para o script poder criar o diretório caso ele não exista
#Utilize o script da seguinte forma: script.sh pasta_destido
#Informe no arquivo lista os nomes dos arquivos deseja separar
#Versão:1.0 - Agora exibe menssagem se o arquivo existe ou não, faz busca recursiva no diretório local e gera um arquivo de log com a data atual informando se localizou ou não o arquivo
#Script Elaborado por: Bruno Souza

#verifica se a pasta existe
if [ -e $1 ]; then
	echo "O diretório $1 existe"
else
	echo "Criando o diretório $1 ..."
	mkdir $1
fi

#Converte o arquivo de ms-dos para unix
#Caso precise fazer o inverso, o comando é unix2dos
#precisa ser instalado previamente. É usando quando o arquivo de texto não foi formatado no linux
dos2unix lista

#loop para copiar os arquivos
for i in $(cat lista);
do

#Define as variaveis DIR para diretorio e FILE para o nome do arquivo
DIR=./$1/
FILE=$i

#localiza o arquivo e copia para a pasta
find . -name $i* -exec cp {} $1 \;

#Verifica se o arquivo existe na pasta
if [ -e "$DIR$FILE"* ]; then

#Se o arquivo existe, exibe uma mensagem dizendo que o arquivo foi encontrado
echo "arquivo existe:" $i

#Se o arquivo não existe é gerado um log com o a data e hora atual e nome do arquivo
else
echo date "+%d/%m/%Y %H:%M:%S - Arquivo não encontrado:" $i >> logerro.log
fi
done
