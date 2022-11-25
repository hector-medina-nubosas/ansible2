#!/bin/bash
RESULT=$(ansible-pull -U https://github.com/hector-medina-nubosas/ansible2.git -C nginx-latest sample-app/roles/common/
echo "$RESULT" >> /root/registro.log