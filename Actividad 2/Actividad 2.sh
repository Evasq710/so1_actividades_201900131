#!/bin/bash
GITHUB_USER=Evasq710
GITHUB_INFO=$( curl https://api.github.com/users/$GITHUB_USER )

GIT_USERID=$(  jq -r -n --argjson github_info "$GITHUB_INFO" '$github_info.login' )
GIT_ID=$( jq -r -n --argjson github_info "$GITHUB_INFO" '$github_info.id' )
GIT_CREATED_AT=$( jq -r -n --argjson github_info "$GITHUB_INFO" '$github_info.created_at' )

# put current date as yyyy-mm-dd in $date
# -1 -> explicit current date
# -2 -> start time for shell
printf -v ACTUAL_PATH '/tmp/%(%Y%m%d)T/saludos.log' -1 

mkdir -p "${ACTUAL_PATH%/*}"

echo “Hola $GIT_USERID. User ID: $GIT_ID. Cuenta fue creada el: $GIT_CREATED_AT.” > $ACTUAL_PATH

