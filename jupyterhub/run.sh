#!/bin/bash

docker run --rm -it \
  -v /Users/benoit.martin/docker/jupyterhub/data:/srv/jupyterhub \
  -v /Users/benoit.martin/docker/jupyterhub/user_homes:/home \
  -v /Users/benoit.martin/docker/jupyterhub/shared_data:/shared_data \
  -p 8000:8000 --name jupyterhub test_jupyterhub jupyterhub --config=/srv/jupyterhub/jupyterhub_config.py

