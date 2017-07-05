#!/bin/bash
# MSYS_NO_PATHCONV fixes paths on Docker Toolbox on Windows using Git Bash / Mingw
# Harmless everywhere else.
export MSYS_NO_PATHCONV=1
docker-compose exec pybossa supervisorctl stop pybossa
docker-compose exec db sh /scripts/reset_pybossa_db.sh
docker-compose exec pybossa supervisorctl start pybossa
docker-compose exec --user pybossa pybossa sh /ansible_build/init_db.sh
