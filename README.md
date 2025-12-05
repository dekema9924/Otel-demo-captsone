OpenTelemetry Observability Dashboard Project

Using Grafana • Prometheus • ElasticSearch • OpenTelemetry Demo (Frontend + Services)

📌 Overview

This project implements a full OpenTelemetry (OTel) observability stack running on a Linux server environment using Docker + Docker Compose.
Our team created an end-to-end dashboard to visualize traces, metrics, and logs collected from the OpenTelemetry Demo application and exported to:

Prometheus – Metrics backend

ElasticSearch – Logs + Trace storage

Grafana – Unified dashboards for metrics, traces, and logs

The setup provides a complete demonstration of how organizations can implement modern observability using open-source tools.

🏗️ Architecture Overview
        ┌──────────────────────┐
        │   OTel Demo App      │
        │ (frontend + services)│
        └─────────┬────────────┘
                  │
     ┌────────────┼──────────────┐
     │            │              │
 Metrics       Logs           Traces
     │            │              │
     ▼            ▼              ▼
Prometheus   ElasticSearch   ElasticSearch
     │            │              │
     └────────────┼──────────────┘
                  ▼
              Grafana UI

🖥️ Technologies Used
Component	Purpose
OpenTelemetry Demo	Generates traces, metrics, logs
Docker & Docker Compose	Containerize entire environment
Prometheus	Metrics collection and scraping
ElasticSearch	Trace & log storage
Grafana	Dashboard visualization
Linux (RHEL9)	Server environment for deployment
📦 Project Structure

Example structure (simplify or adjust based on your repo):

otel-prototype/
│── docker-compose.yaml
│── grafana/
│   └── dashboards/
│── prometheus/
│   └── prometheus.yml
│── elasticsearch/
│── test/
│   └── tracetesting/
│       └── tracetest-provision.yaml
└── README.md

🚀 Deployment Instructions
1. Clone the Repository
git clone https://github.com/dekema9924/Otel-demo-captsone.git
cd Otel-demo-captsone

2. Start all containers
docker compose up -d

3. Verify services are running
docker ps

4. Access the Dashboards
Service	URL
Grafana	http://localhost:3000

Prometheus	http://localhost:9090

ElasticSearch (API)	http://localhost:9200

OTel Demo Frontend	http://localhost:8080

(Default Grafana login = admin / admin unless customized)

📈 Dashboards Included

In Grafana, we created/connected dashboards for:

Service Traces (OTel)

Latency, Throughput, Error Rates (RED metrics)

Application Metrics from Prometheus

Log analysis through ElasticSearch data source

End-to-end request path visualization

🧪 Trace Testing

The project includes trace test provisioning:

test/tracetesting/tracetest-provision.yaml


Used to validate:

Span completeness

Trace attributes

End-to-end request paths

Service dependency connections

⚙️ Configuration Highlights
OpenTelemetry Collector

Configured to export:

Metrics → Prometheus

Logs → ElasticSearch

Traces → ElasticSearch

Docker Compose

Handles startup order, networking, and persistent volumes.

Linux Server Setup

We executed all configuration and container operations from a RHEL9 environment.

👥 Team Contributions

Each team member contributed to one or more of the following:

Environment provisioning

Docker Compose configuration

OTel collector setup

Grafana dashboard design

Prometheus scraping configuration

ElasticSearch integration

Trace testing automation

(Add specific names if required.)

📚 Future Improvements

Add Jaeger or Tempo as alternative trace backends

Create automated alerting rules for Prometheus

Add synthetic load testing for richer traces/metrics

Use Kubernetes instead of Docker Compose

📄 License

This project is open for educational use.
Add a license (MIT, Apache 2.0, etc.) if you want official terms.
