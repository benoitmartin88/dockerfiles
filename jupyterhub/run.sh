#!/bin/bash

docker run --rm -it \
  -v ${pwd}/data:/srv/jupyterhub \
  -v ${pwd}/user_homes:/home \
  -v ${pwd}/shared_data:/shared_data \
  -p 8000:8000 --name jupyterhub test_jupyterhub jupyterhub --config=/srv/jupyterhub/jupyterhub_config.py

