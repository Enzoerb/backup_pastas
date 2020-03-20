PASTA_ATUAL="$1"

if [ "${PASTA_ATUAL: -1}" == "/" ]; then
  PASTA_ATUAL=${PASTA_ATUAL::-1}
fi

if [ ! -e "/${PASTA_ATUAL}_backup" ]; then
  mkdir "/${PASTA_ATUAL}_backup"
fi

exception="$PASTA_ATUAL/target"
PASTAS_FOR=${PASTA_ATUAL}/*

for arquivo in $PASTAS_FOR
do
  if [ "$arquivo" != "$exception" ]; then 
    tar -czf "${arquivo}.tar.gz" "$arquivo"
    mv "${arquivo}.tar.gz" "/${PASTA_ATUAL}_backup"
  fi 
done
