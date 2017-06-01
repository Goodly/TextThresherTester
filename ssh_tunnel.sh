#!/bin/bash
ssh -L 5000:$(docker-machine ip):5000 docker@$(docker-machine ip)
