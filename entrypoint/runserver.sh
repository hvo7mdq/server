#!/bin/sh
printenv
poetry install
poetry run uvicorn --host 0.0.0.0 --port 8000  main:app

