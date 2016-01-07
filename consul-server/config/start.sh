#!/bin/sh

until ping -c 1 rancher-metadata
do
  echo "trying to connect with metadata server"
  sleep 1
done

client_ip="$(curl http://rancher-metadata/latest/self/container/primary_ip)"
host_name="$(curl http://rancher-metadata/latest/self/host/name)"

echo "Using client ip: $client_ip"

/bin/consul agent -node "$host_name" -client "$client_ip" -advertise "$client_ip" "$@"

