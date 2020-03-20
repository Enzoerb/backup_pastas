PARAM="$1"

for (( i=1; i<11; i++ )); do
  mkdir ${PARAM}/dir_${i}
  for (( j=1; j<=i; j++ )); do
    touch ${PARAM}/dir_${i}/arquivo${j}.txt
  done
  touch ${PARAM}/arquivo.txt
done

mkdir ${PARAM}/target

