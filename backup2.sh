function format_folder_adress ()
{

  if [ ! -e "$MAIN_FOLDER" ]
  then
    echo folder does not exist
    exit
  elif [ "${MAIN_FOLDER: -1}" == "/" ]
  then
    MAIN_FOLDER=${MAIN_FOLDER::-1}
  fi

}


function create_backup_adress ()
{

  if [ ! -e "/${MAIN_FOLDER}_backup" ] 
  then
    BACKUP_FOLDER="/${MAIN_FOLDER}_backup"
  else
    for (( i=2; 0 == 0; i++ )); do

      if [ ! -e "/${MAIN_FOLDER}_backup(${i})" ]
      then
        BACKUP_FOLDER="/${MAIN_FOLDER}_backup(${i})"
        break
      fi

    done
  fi

}


main ()
{

  format_folder_adress 
  create_backup_adress 
  mkdir "$BACKUP_FOLDER"
  actual_date=$(date +%Y%m%d)
  tar -zcf "${MAIN_FOLDER}_${actual_date}.tar.gz" --exclude="${MAIN_FOLDER}/target" "$MAIN_FOLDER"
  mv "${MAIN_FOLDER}_${actual_date}.tar.gz" "$BACKUP_FOLDER"

}


MAIN_FOLDER="$1"
main
