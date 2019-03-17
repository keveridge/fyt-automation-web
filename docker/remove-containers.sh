#!/bin/bash
docker container rm -v -f docker_fyt_grandnode_1
docker container rm -v -f docker_fyt_mongodb_1
docker volume rm docker_fyt_mongodb_data