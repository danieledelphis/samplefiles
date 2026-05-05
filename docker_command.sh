#!/bin/bash

#docker command (alternative al compose)
docker run -d --name quickshop -e POSTGRES_USER=quickshop -e POSTGRES_PASSWORD=quickshop -e POSTGRES_DB=quickshop -p 5432:5432 -v ./csv:/csv:ro postgres:16
