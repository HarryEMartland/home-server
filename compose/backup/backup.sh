

auth=$(curl -X 'POST' \
    --retry 3 \
    "$HOST/api/auth/token" \
    -H 'accept: application/json' \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    -d 'grant_type=&username='$USERNAME'&password='$PASSWORD'&scope=&client_id=&client_secret=' \
    | jq -r ".access_token")

curl "$HOST/api/admin/backups" \
--retry 3 \
-X 'POST' \
-H 'accept: application/json' \
-H "Authorization: Bearer $auth"

backupName=$(curl "$HOST/api/admin/backups" \
--retry 3 \
-H 'accept: application/json' \
-H "Authorization: Bearer $auth" | jq -r ".imports[0].name")

backupToken=$(curl "$HOST/api/admin/backups/$backupName" \
--retry 3 \
-H 'accept: application/json' \
-H "Authorization: Bearer $auth" | jq -r ".fileToken")

curl -o "/$backupName" "$HOST/api/utils/download?token=$backupToken" \
--retry 3 \
-H "Authorization: Bearer $auth"

aws s3 cp --storage-class GLACIER_IR "/$backupName" "$S3PATH/$backupName"

rm "/$backupName"