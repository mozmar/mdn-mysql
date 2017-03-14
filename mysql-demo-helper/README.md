# mdn-mysql-demo-import-helper

The Dockerfile and scripts in this directory build an image (`quay.io/mozmar/mdn-myql-demo-import-helper`) that load a sample database into kuma demo MySQL instances.

#### Building the image

```
make
```

#### Example

Here's an example that starts up a temporary pod to restore data into a Kuma demo MySQL instance:

```
MYSQL_PORT=3306
MDN_SAMPLE_DB_URL=https://mdn-downloads.s3-us-west-2.amazonaws.com/mdn_sample_db.sql.gz
MYSQL_DATABASE=developer_mozilla_org
DOCKER_IMAGE="quay.io/mozmar/mdn-myql-demo-import-helper
"
POD_NAME="mdn-db-import"

kubectl run mdn-db-import \
        --image ${DOCKER_IMAGE} \
        -it \
        --rm  \
        -n "${KUBE_NAMESPACE}" \
        --restart=Never \
        --env="MYSQL_ROOT_PASSWORD=kuma" \
        --env="MYSQL_USER=root" \
        --env="MYSQL_PASSWORD=kuma" \
        --env="MYSQL_DATABASE=$MYSQL_DATABASE" \
        --env="MYSQL_IP=$MYSQL_IP" \
        --env="MYSQL_PORT=$MYSQL_PORT" \
        --env="MDN_SAMPLE_DB_URL=$MDN_SAMPLE_DB_URL"
```