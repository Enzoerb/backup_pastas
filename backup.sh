function check_parameters ()
{

  if [ ! -e "$MAIN_FOLDER" ]
  then
    echo folder does not exist
    exit
  fi

}


function format_folder_adress ()
{

  if [ "${MAIN_FOLDER: -1}" == "/" ]
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


function compress_files ()
{

  PASTAS_FOR=${MAIN_FOLDER}/*
  exception="$MAIN_FOLDER/target"
  actual_date=$(date +%d-%m-%Y)

  for arquivo in $PASTAS_FOR
  do
    
    if [ "$arquivo" != "$exception" ]
    then 
      tar -czf "${arquivo}(${actual_date}).tar.gz" "$arquivo"
    fi
  
  done

}


main ()
{

  check_parameters
  format_folder_adress 
  create_backup_adress 
  mkdir "$BACKUP_FOLDER"
  compress_files 
  mv $MAIN_FOLDER/*.tar.gz "$BACKUP_FOLDER"

}


MAIN_FOLDER="$1"
main
