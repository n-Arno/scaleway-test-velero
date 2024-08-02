Velero @ Scaleway Kapsule
=========================

Quick test of Velero using Scaleway Kapsule.

Edit the `credentials` file and add your API key with access to Scaleway Object Storage bucket:

```
[default]
aws_access_key_id=SCWXXXXXXXXXXXXXXXXX
aws_secret_access_key=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

Edit the `install.sh` file and add your bucket name, change region and endpoint if needed.

```
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
```

Install the velero CLI, for example on Mac OSX:

```
brew install velero
```

Ensure your kubeconfig file is accessible from CLIs:

```
kubectl get nodes
```

Install using:

```
./install.sh
```

You can start a demo app with a volume to be backup using the corresponding annotation:

```
kubectl apply -f demo.yaml
```

Trigger backups using Velero CLI

```
velero backup create my-backup --include-namespaces='default'
```

As you can see, Kopia is used to do the Pod volume backup:

```
Backup Volumes:
  Velero-Native Snapshots: <none included>

  CSI Snapshots: <none included or not detectable>

  Pod Volume Backups - kopia (specify --details for more information):
    In Progress:  1
```
