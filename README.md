# SOCIAL PULSE

> **Feel the Pulse. Understand the Network.**  
> *AI-Powered Enterprise Social Media Intelligence Platform*

[![Zero Dummy Data Enforced](https://img.shields.io/badge/Policy-Zero--Dummy--Data-emerald.svg)](#zero-dummy-data-policy)
[![FastAPI](https://img.shields.io/badge/FastAPI-v0.110+-009688.svg)](https://fastapi.tiangolo.com)
[![React](https://img.shields.io/badge/React-v18.2+-61DAFB.svg)](https://react.dev)
[![TypeScript](https://img.shields.io/badge/TypeScript-v5.2+-3178C6.svg)](https://www.typescriptlang.org)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-v16-336791.svg)](https://www.postgresql.org)
[![Redis](https://img.shields.io/badge/Redis-v7-DC382D.svg)](https://redis.io)

---

## 1. Project Overview & Problem Addressed

Modern decision-makers and intelligence analysts face an overwhelming deluge of unstructured social information across disparate communication platforms (X, Telegram, forums). Existing tools either:
- Rely on superficial vanity metrics (simple like/retweet tallies).
- Obscure provenance by mixing fabricated or synthetic demonstration statistics into dashboards.
- Fail to calculate information flow dynamics, emotional undercurrents, and network topology simultaneously.

**SOCIAL PULSE** is an enterprise AI-driven Social Media Analytics Framework engineered to provide verified, explainable intelligence:
1. **Continuous Data Collection & Ingestion**: Pluggable adapters for real platform APIs (X, Telegram, Instagram, Reddit, YouTube) and offline CSV/JSON imports.
2. **Contextual NLP & Emotion Inference**: Multi-dimensional sentiment, discrete emotion classification, and sarcasm likelihood scoring.
3. **Aggregate Demographic Profiling**: Strictly anonymized, privacy-preserving audience estimation.
4. **Real-Time Trend Dynamics**: Sliding-window volume, growth velocity, and cross-platform propagation tracking.
5. **Topology & Link Analysis**: NetworkX graph computation for degree centrality, betweenness, PageRank influence, and community clustering.

---

## 2. Zero-Dummy-Data Policy (Non-Negotiable)

SOCIAL PULSE strictly enforces an authentic data policy. **The platform NEVER generates synthetic, random, or hardcoded analytics.**

- **No `Math.random()` or hardcoded KPIs**: Dashboard metrics (`Total Posts`, `Active Users`, `Sentiment %`, `Trending Topics`, `Influence Score`) are calculated directly from verified database records.
- **Empty States When Data is Absent**: When no platform is connected or no dataset has been imported, the user interface displays informative empty states:
  - *No Social Data Available — Connect a platform or import a dataset to begin analyzing audience activity.*
  - KPI indicators show `--` and `No data`.
  - Charts display *No data available for the selected period.*
- **DEMO_MODE=false**: Enforces zero synthetic data in all deployment tiers.

---

## 3. High-Level Architecture

```
                 SOCIAL MEDIA SOURCES
                         │
        ┌────────────────┼────────────────┐
        │                │                │
        ▼                ▼                ▼
      X API          TELEGRAM        OTHER ADAPTERS
                                  (CSV / JSON / Reddit)
        │                │                │
        └────────────────┼────────────────┘
                         │
                         ▼
               DATA INGESTION ADAPTERS
                         │
                         ▼
               REDIS JOB QUEUE (Celery/Workers)
                         │
        ┌────────────────┼────────────────┐
        │                │                │
        ▼                ▼                ▼
   NLP ENGINE       TREND ENGINE     GRAPH ENGINE
  (Transformer)   (Sliding Window)    (NetworkX)
        │                │                │
        └────────────────┼────────────────┘
                         │
                         ▼
                 POSTGRESQL DATABASE
                         │
                         ▼
                  FASTAPI BACKEND
                     (/api, /health)
                         │
                         ▼
                 REACT + TS DASHBOARD
              (Restrained Dark Enterprise UI)
```

---

## 4. Technology Stack

- **Frontend**: React 18, TypeScript, Vite, Tailwind CSS, TanStack Query, Lucide Icons, React Router DOM.
- **Backend**: Python 3.11, FastAPI, Pydantic v2 Settings, SQLAlchemy 2.0.
- **Data Stores**: PostgreSQL 16 (relational schema & relational graph metrics), Redis 7 (queue & operational caching).
- **Processing & Workers**: Standalone pipeline background worker process.
- **Containerization**: Docker Compose orchestrating 5 core services (`frontend`, `backend`, `postgres`, `redis`, `worker`).

---

## 5. Repository Structure

```
social-pulse/
├── frontend/
│   ├── src/
│   │   ├── components/      # UI components (KPICard, EmptyState, Navbar, Sidebar)
│   │   ├── pages/           # Routed pages (Dashboard, Feed, Sentiment, Audience, Trends, Network, Pipeline, Platforms, Login)
│   │   ├── layouts/         # Enterprise AppLayout wrapper
│   │   ├── charts/          # Analytical chart definitions & palettes
│   │   ├── graph/           # Network topology configuration
│   │   ├── hooks/           # Custom hooks (useHealth, etc.)
│   │   ├── services/        # API client & fetch services
│   │   ├── store/           # Global filter state
│   │   ├── types/           # Strongly typed Section 53 data contracts
│   │   └── utils/           # Styling & utility helpers
│   ├── public/              # Static public assets
│   ├── package.json
│   ├── vite.config.ts
│   ├── tailwind.config.js
│   └── Dockerfile
│
├── backend/
│   ├── app/
│   │   ├── main.py          # FastAPI application, CORS, lifespan, /health
│   │   ├── config.py        # Pydantic v2 settings & environment binding
│   │   ├── database.py      # SQLAlchemy engine, session maker, connection check
│   │   ├── redis_client.py  # Redis health verification
│   │   ├── api/             # API route handlers (/health, /system/status)
│   │   ├── models/          # PostgreSQL SQLAlchemy models (Section 11)
│   │   ├── schemas/         # Pydantic validation schemas
│   │   ├── services/        # Core analytical modules
│   │   │   ├── ingestion/   # Adapters for X, Telegram, CSV, JSON
│   │   │   ├── nlp/         # Contextual transformer processing
│   │   │   ├── sentiment/   # Sentiment polarity & emotion evaluation
│   │   │   ├── demographics/# Aggregate audience profiling
│   │   │   ├── trends/      # Topic velocity & lifecycle detection
│   │   │   └── network/     # NetworkX graph topology & PageRank
│   │   ├── workers/         # Redis background queue workers
│   │   └── utils/           # Structured logging & helpers
│   ├── tests/               # Pytest suite
│   ├── requirements.txt
│   └── Dockerfile
│
├── data/
│   ├── imports/             # Raw imported dataset files (CSV, JSON)
│   └── processed/           # Normalization & ingestion artifacts
│
├── scripts/
│   ├── import_dataset.py    # CLI tool for dataset validation & ingestion
│   ├── run_pipeline.py      # Pipeline runner across analytical engines
│   └── setup_admin.py       # Secure initial administrator setup
│
├── docker-compose.yml       # Production multi-service orchestration
├── .env.example             # Documented environment variables template
├── Makefile                 # Developer build & run targets
└── README.md
```

---

## 6. Installation & Quick Start

### Option A: Running with Docker Compose (Recommended)

1. Clone and navigate to the project directory:
   ```bash
   cd social-pulse
   ```

2. Copy environment template:
   ```bash
   cp .env.example .env
   ```

3. Start all services (PostgreSQL, Redis, Backend, Worker, Frontend):
   ```bash
   docker compose up --build
   ```

4. Access the applications:
   - **Frontend Dashboard**: [http://localhost:3000](http://localhost:3000)
   - **Backend API**: [http://localhost:8000](http://localhost:8000)
   - **Interactive API Docs (Swagger)**: [http://localhost:8000/docs](http://localhost:8000/docs)
   - **ReDoc Documentation**: [http://localhost:8000/redoc](http://localhost:8000/redoc)
   - **Health Endpoint**: [http://localhost:8000/health](http://localhost:8000/health)

---

### Option B: Local Development Setup (Without Docker)

#### 1. Backend Setup:
```bash
cd social-pulse/backend
python -m venv venv
# On Windows:
.\venv\Scripts\activate
# On Linux/macOS:
source venv/bin/activate

pip install -r requirements.txt
uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

#### 2. Frontend Setup:
```bash
cd social-pulse/frontend
npm install
npm run dev
```

---

## 7. Environment Variables Reference

| Variable | Default Value | Description |
| :--- | :--- | :--- |
| `DEMO_MODE` | `false` | **Strict Zero-Dummy-Data flag.** Must be `false` to prohibit synthetic records. |
| `DATABASE_URL` | `postgresql://postgres:postgres@localhost:5432/social_pulse` | PostgreSQL connection URI. |
| `REDIS_URL` | `redis://localhost:6379/0` | Redis queue and operational cache connection URI. |
| `SECRET_KEY` | `social-pulse-secret-key-change-in-production-min32chars` | Cryptographic secret for JWT authentication. |
| `LOG_LEVEL` | `INFO` | Structured logging verbosity (`DEBUG`, `INFO`, `WARNING`, `ERROR`). |
| `X_API_KEY` | *(empty)* | X (Twitter) API Consumer Key. |
| `X_API_SECRET` | *(empty)* | X (Twitter) API Consumer Secret. |
| `X_ACCESS_TOKEN` | *(empty)* | X (Twitter) OAuth Access Token. |
| `TELEGRAM_BOT_TOKEN` | *(empty)* | Telegram Bot API token. |
| `MODEL_NAME` | `cardiffnlp/twitter-roberta-base-sentiment-latest` | HuggingFace NLP transformer model name. |

---

## 8. Verification & Test Execution

Run backend automated tests:
```bash
cd backend
python -m pytest tests
```

Build and test frontend TypeScript compilation:
```bash
cd frontend
npm run build
```

Verify backend `/health` endpoint:
```bash
curl http://localhost:8000/health
```

Sample output:
```json
{
  "status": "healthy",
  "version": "1.0.0",
  "environment": "development",
  "demo_mode": false,
  "database": {
    "status": "connected",
    "database": "postgresql"
  },
  "redis": {
    "status": "connected",
    "url": "redis:6379/0"
  }
}
```

---

## 9. Security & Governance

- **Credentials Separation**: No API credentials or database passwords are hardcoded in the frontend code.
- **Privacy Preservation**: Users and post authors are referenced exclusively via cryptographically hashed identifiers (`display_name_hash`).
- **Demographic Transparency**: All inferred demographic segments are strictly labeled `Estimated / Inferred Only` with confidence ratings, never confirmed identities.

---

## 10. Hackathon Demonstration Flow

1. **Access Login**: Open `http://localhost:3000/login`. Enter analyst credentials to authenticate.
2. **Inspect Dashboard Empty State**: Observe clean enterprise UI. Confirm all KPI cards show `--` and `No data`, indicating no fabricated stats.
3. **Review Pipeline Status**: Visit `http://localhost:3000/pipeline` to inspect ingestion workers and queue metrics.
4. **Connect Sources / Ingest Dataset**: Ingest real datasets via `scripts/import_dataset.py` or platform configuration.
5. **View Live Updates**: Watch verified posts, sentiment analysis, trend lifecycles, and network topologies populate authentically.
