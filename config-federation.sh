#!/bin/bash

set -ux

# TODO: optional initial setup
# openstack mapping create --rules  federation_mapping.json keycloak_mapping
# openstack identity provider create --remote-id https://idp.stackhpc.com/auth/realms/iris-cambridge keycloak
# openstack federation protocol create --identity-provider keycloak --mapping keycloak_mapping mapped

# update mappings
openstack mapping set --rules federation_mapping.json keycloak_mapping
