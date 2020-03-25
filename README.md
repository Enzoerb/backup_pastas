# backup_pastas

## backup.sh

given a certain directory it will create a directory_backup in the root saving everything that was in the given directory compressed as .tar.gz in the directory_backup(except for the folder "target"), each file will be called file(DD-MM-YYYY).tar.gz with DD-MM-YYYY being the format of the actual date

## backup2.sh

given a certain directory it will create a directory_backup in the root and the given directory will be compressed and saved as directory_YYYYMMDD.tar.gz inside directory_backup (without the folder "target"), YYYYMMDD being the format of the actual date

## gera_estrutura.sh

generates a structure of files and folders to try the scripts out
