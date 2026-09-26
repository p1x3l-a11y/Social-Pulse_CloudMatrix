.PHONY: help setup run stop test import migrate clean

help:
	@echo "SOCIAL PULSE — Developer Commands"
	@echo "---------------------------------"
	@echo "make setup    : Initialize .env and install dependencies"
	@echo "make run      : Start all services via Docker Compose"
	@echo "make stop     : Stop all running containers"
	@echo "make test     : Run test suite for backend and frontend"
	@echo "make import   : Run data ingestion script for local dataset"
	@echo "make migrate  : Initialize database tables"
	@echo "make clean    : Remove build caches and containers"

setup:
	cp -n .env.example .env || true
	cd backend && pip install -r requirements.txt
	cd frontend && npm install

run:
	docker compose up --build

stop:
	docker compose down

test:
	cd backend && pytest
	cd frontend && npm run test || npm run build

import:
	cd backend && python ../scripts/import_dataset.py

migrate:
	cd backend && alembic upgrade head

clean:
	docker compose down -v
