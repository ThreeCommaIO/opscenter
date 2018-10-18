#!/bin/bash
set -e
CLUSTER_NAME=${CLUSTER_NAME:-test}
CLUSTER_SEEDS=${CLUSTER_SEEDS:-127.0.0.1}
STORAGE_SEEDS=${STORAGE_SEEDS:-127.0.0.1}
CONFIG=/opt/opscenter/conf/clusters/$CLUSTER_NAME.conf

echo "Creating config file: $CONFIG"
mkdir /opt/opscenter/conf/clusters
cat > $CONFIG << EOF
[storage_cassandra]
seed_hosts = $STORAGE_SEEDS
keyspace = OpsCenter_$CLUSTER_NAME

[kerberos]
default_service =
opscenterd_client_principal =
opscenterd_keytab_location =
agent_keytab_location =
agent_client_principal =

[agents]
ssl_truststore_password =
ssl_keystore_password =
ssl_keystore =
ssl_truststore =

[jmx]
password =
port = 7199
username =

[cassandra]
ssl_truststore_password =
cql_port = 9042
seed_hosts = $CLUSTER_SEEDS
password =
ssl_keystore_password =
ssl_keystore =
ssl_truststore =
username =
EOF

exec "/entrypoint.sh" "-f" "$@"