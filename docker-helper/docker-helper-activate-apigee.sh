#!/bin/bash -l

cd /bootstrap-runtime
pyenv activate apigee
pip install -r docker-helper/docker-helper-requirements.txt

#cd docker-helper
#ansible-playbook tutorial-config.yml

