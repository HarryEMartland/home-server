
podman exec paperless python manage.py document_exporter  --zip ../export

podman exec paperless-backup sh ./backup.sh

