#!/bin/bash

docker run --rm -v $(pwd):/project openpolicyagent/conftest test Dockerfile