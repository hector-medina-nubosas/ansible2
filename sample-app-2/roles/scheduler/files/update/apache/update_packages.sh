#!/bin/bash
RESULT=$(ansible-pull -U https://github.com/hector-medina-nubosas/ansible2.git -C apache-latest sample-app-2/apache-server-update.yml)
echo "$RESULT" >> /root/registro.log