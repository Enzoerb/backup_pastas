ARVORE="$1"
PRIMEIRO_CARACTERE=${ARVORE::1}
ARVORE=$(echo $ARVORE | tr "/" "\n")

if [ $PRIMEIRO_CARACTERE == "/" ]; then
  PASTA_ATUAL="/"
else
  PASTA_ATUAL=""
fi

for PASTA in $ARVORE
do
  PASTA_ATUAL="${PASTA_ATUAL}${PASTA}/"
  
  if [ ! -e "${PASTA_ATUAL}" ]; then
    mkdir "${PASTA_ATUAL}"
  fi

done
