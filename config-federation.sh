#!/bin/bash

set -ux

# initial setup
openstack mapping create --rules  federation_mapping.json keycloak_mapping
openstack identity provider create --remote-id https://idp.stackhpc.com/auth/realms/iris-cambridge keycloak
openstack federation protocol create --identity-provider keycloak --mapping keycloak_mapping mapped

# update mappings
openstack mapping set --rules  federation_mapping.json keycloak_mapping

# very cumulus specific
iris_project_id=190eb5f98d994fcca43e9abb0867d319
fed_domain_id=ee408625947942aa8b21f86831b39339

# set quotas to zero for iris project
# TODO: ideally set default quota to zero

openstack quota set \
  --server-groups 0 --ram 0 --key-pairs 1 \
  --instances 0 --cores 0 \
  $iris_project_id

openstack quota set \
  --subnetpools 0\
  --ports 0 --subnets 0 --networks 0\
  --floating-ips 0 --secgroup-rules 0 --secgroups 0\
  --routers 0 --rbac-policies 0 --vips 0\
  $iris_project_id

openstack quota set --snapshots 0 --volumes 0 --backups 0 $iris_project_id
openstack quota set --gigabytes 0 --backup-gigabytes 0 --volume-type 0 $iris_project_id

 #--l7policies 0 --vips 0 --health-monitors 0 \
