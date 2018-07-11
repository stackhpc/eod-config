=======================================
Evolution of Darwin (EoD) Configuration
=======================================

This project contains Ansible playbooks and configuration of infrastructure on
an existing OpenStack cloud for the Cambridge UIS Evolution of Darwin (EoD)
system.  This includes:

* A demo project and user accounts in OpenStack keystone.
* Compute node flavors in OpenStack nova for the various compute and storage
  node types.
* Networks, subnets and routers in OpenStack neutron for the external ``ilab``
  and internal networks.

Preparation
===========

Ensure that Ansible is installed, either via the system package manager or pip.
If required, use a virtualenv to avoid interference with the system python
packages. For example:

.. code-block::

   $ virtualenv venv
   $ source venv/bin/activate
   $ pip install -U pip
   $ pip install -r requirements.txt

Install Ansible role dependencies from Ansible Galaxy:

.. code-block::

   $ ansible-galaxy install \
       -p ansible/roles \
       -r requirements.yml

Usage
=====

First, ensure that OpenStack authentication environment variables are set,
typically by sourcing an OpenStack environment file.

To configure OpenStack infrastructure:

.. code-block::

   $ tools/eod-config

To run a specific playbook:

.. code-block::

   $ tools/eod-config -p </path/to/playbook>

To specify additional arguments to ``ansible-playbook``, separate them with a
double hyphen (``--``):

.. code-block::

   $ tools/eod-config -- <arguments>

For example, a vault secret stored as a file can be passed as an extra
configuration parameter:

.. code-block::

   $ tools/eod-config -- --vault-password-file config-secret.vault 
