

aws s3 sync --storage-class GLACIER_IR "/paperless/media" "$S3PATH/"
aws s3 sync --storage-class GLACIER_IR "/paperless/data" "$S3PATH/"
aws s3 sync --storage-class GLACIER_IR "/paperless/export" "$S3PATH/"
