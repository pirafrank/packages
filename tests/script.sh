#!/bin/bash

docker build -t apt-test -f apt.dockerfile .
docker run --rm apt-test

docker build -t yum-test -f yum.dockerfile .
docker run --rm yum-test
