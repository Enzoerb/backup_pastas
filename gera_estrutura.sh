ARVORE="$1"
ARVORE=$(echo $ARVORE | tr "/" "\n")
PASTA_ATUAL=""

for PASTA in $ARVORE
do
  PASTA_ATUAL="$PASTA_ATUAL/$PASTA"
  
  if [ ! -e "${PASTA_ATUAL}" ]; then
    mkdir "${PASTA_ATUAL}"
  fi

done
