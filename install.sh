#!/bin/sh

velero install \
--provider aws \
--plugins velero/velero-plugin-for-aws:v1.9.2 \
--bucket MY-BUCKET \
--backup-location-config s3Url=https://s3.fr-par.scw.cloud,region=fr-par \
--use-volume-snapshots=false \
--use-node-agent \
--privileged-node-agent \
--default-volumes-to-fs-backup \
--secret-file ./credentials
