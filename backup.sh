PASTA_ATUAL="$1"

if [ "${PASTA_ATUAL: -1}" == "/" ]; then
  PASTA_ATUAL=${PASTA_ATUAL::-1}
fi

if [ ! -e "/${PASTA_ATUAL}_backup" ]; then
  PASTA_BACKUP="/${PASTA_ATUAL}_backup"
else
  i=2
  for (( i=2; 0 == 0; i++ )); do
    if [ ! -e "/${PASTA_ATUAL}_backup(${i})" ]; then
      PASTA_BACKUP="/${PASTA_ATUAL}_backup(${i})"
      break
    fi
  done
  
fi
mkdir "$PASTA_BACKUP"

exception="$PASTA_ATUAL/target"
PASTAS_FOR=${PASTA_ATUAL}/*

for arquivo in $PASTAS_FOR
do
  
  if [ "$arquivo" != "$exception" ]; then 
    
    tar -czf "${arquivo}.tar.gz" "$arquivo"
    mv "${arquivo}.tar.gz" "${PASTA_BACKUP}"

  fi 
done
