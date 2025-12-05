# OpenTelemetry Observability Dashboard

[![OpenTelemetry](https://img.shields.io/badge/OpenTelemetry-Enabled-blue)]()
[![Grafana](https://img.shields.io/badge/Grafana-Dashboard-orange)]()
[![Prometheus](https://img.shields.io/badge/Prometheus-Metrics-red)]()
[![ElasticSearch](https://img.shields.io/badge/ElasticSearch-Logs%20%26%20Traces-green)]()
[![Docker](https://img.shields.io/badge/Docker-Compose-informational)]()
[![Linux](https://img.shields.io/badge/Linux-RHEL9-critical)]()

A comprehensive observability solution using OpenTelemetry, Grafana, Prometheus, and ElasticSearch to monitor distributed applications with full-stack visibility into metrics, traces, and logs.

![Project Banner](./docs/images/banner.png)

---

## 📂 Project Submission Links

**Course Deliverables - Quick Access**

| # | Deliverable | Link |
|---|-------------|------|
| 1 | IT-Capstone-Opentelemetry-WeeklyLog | [View Document](./docs/submissions/IT-Capstone-Opentelemetry-WeeklyLogNew_Reversed_Full.docx) |
| 2 | Milestone 3 Presentation | [View Slides](./docs/submissions/Milestone%203%20NEW.pptx) |
| 3 | OpenTelemetry Observability Dashboard Report(docx) | [View Report DOCX](./docs/submissions/OpenTelemetry%20Observability%20Dashboard%20%28final%20Written%20Report%29.docx) |
| 4 | OpenTelemetry Observability DashboardReport(Pdf)  | [View Report PDF](./docs/submissions/OpenTelemetry%20Observability%20Dashboard%20%28final%20Written%20Report%29.pdf) |
| 5 | OpenTelemetryProjectPlan-3 | [View Plan MPP](./docs/submissions/OpenTelemetryProjectPlan-3.mpp) |
| 6 | OpenTelemetryProjectPlan-3 | [View Plan PDF](./docs/submissions/OpenTelemetryProjectPlan-3.pdf) |
| 7 | OpenTelemetryProjectPlan Resource Overview | [View Overview](./docs/submissions/OpenTelemetryProjectPlanresourceoverview-3.pdf) |
| 8 | Updated Project Plan | [View Document](./docs/submissions/Updated_Project_Plan.docx) |
| 9 | Updated Project Plan | [View PDF](./docs/submissions/Updated_Project_Plan.pdf) |
| 10 | Proof of KSU Writing Center | [View Image](./docs/submissions/proof%20of%20KSU%20writing%20center.png) |
| 11 | Demo Video - Milestone 4 | [Watch Demo](https://kennesawedu.sharepoint.com/:v:/r/sites/Team-ObservabilityDashboard/Shared%20Documents/General/Milestone%203%20Submission/Milestone%204.mp4?csf=1&web=1&e=Zws2Ma&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D) |

> **Note:** All deliverables meet the project requirements as outlined in the course syllabus.
---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Dashboard Screenshots](#dashboard-screenshots)
- [Configuration](#configuration)
- [Trace Testing](#trace-testing)
- [Troubleshooting](#troubleshooting)
- [Team Contributions](#team-contributions)
- [Future Roadmap](#future-roadmap)
- [License](#license)

## Overview

This project implements a production-ready OpenTelemetry observability stack that provides complete visibility into distributed applications. Built on Docker and deployed on RHEL9, it demonstrates enterprise-grade monitoring using open-source tools.

### What This Project Offers

- Full-Stack Observability: Unified view of metrics, logs, and traces
- Real-Time Monitoring: Live dashboards with sub-second refresh rates
- Distributed Tracing: End-to-end request path visualization
- Container-Ready: Fully containerized with Docker Compose
- Production Patterns: Best practices for observability implementation

![Dashboard Overview](https://private-user-images.githubusercontent.com/143339000/522785931-18813b60-4dbf-4e71-b471-a12f10dc648b.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjQ5MTE3ODIsIm5iZiI6MTc2NDkxMTQ4MiwicGF0aCI6Ii8xNDMzMzkwMDAvNTIyNzg1OTMxLTE4ODEzYjYwLTRkYmYtNGU3MS1iNDcxLWExMmYxMGRjNjQ4Yi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIwNVQwNTExMjJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02Yjk3M2E3OTE4ZDIwOTdhYzkzYzIxMjVkNmU4MzlmZDhkNTdlOGFkYzA3MTFkM2ZhN2E2YWM1YzI2NTE1NjIwJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.N8BLuZj_zKG6aVzEJKdJL3h18yj56LK9Y2q1ZKg-Pu4)

## Architecture

Our observability stack follows the OpenTelemetry specification with multiple backend integrations:

```
┌─────────────────────────────────────────────────────────────┐
│                    OTel Demo Application                     │
│              (Microservices + Frontend)                      │
└────────────────────────┬────────────────────────────────────┘
                         │
                         │ OpenTelemetry Protocol (OTLP)
                         │
                         ▼
          ┌──────────────────────────────┐
          │   OpenTelemetry Collector    │
          │    (Receive, Process, Export) │
          └──────────────┬───────────────┘
                         │
            ┌────────────┼────────────┐
            │            │            │
            ▼            ▼            ▼
     ┌──────────┐  ┌──────────┐  ┌──────────┐
     │Prometheus│  │ Elastic  │  │ Elastic  │
     │ Metrics  │  │  Logs    │  │  Traces  │
     └─────┬────┘  └─────┬────┘  └─────┬────┘
           │             │              │
           └─────────────┼──────────────┘
                         │
                         ▼
                  ┌─────────────┐
                  │   Grafana   │
                  │  Dashboards │
                  └─────────────┘
```

![Architecture Diagram](./docs/images/architecture.png)

### Component Details

| Component | Purpose | Port |
|-----------|---------|------|
| OpenTelemetry Demo | Generates realistic telemetry data | 8082 |
| OTel Collector | Receives and exports telemetry | 4317, 4318 |
| Prometheus | Time-series metrics storage | 9092 |
| ElasticSearch | Log and trace storage | 9202 |
| Grafana | Visualization and dashboards | 3002 |
| Jaeger UI | Trace visualization | 16686 |
| Load Generator | Synthetic traffic generation | 8089 |

## Features

### Unified Dashboards
- Service Health Overview: Real-time status of all microservices
- RED Metrics: Rate, Errors, Duration for each service
- Resource Utilization: CPU, memory, and network metrics
- Business Metrics: Custom application-level KPIs

### Distributed Tracing
- End-to-end request flow visualization
- Span-level performance analysis
- Service dependency mapping
- Error propagation tracking

### Metrics Collection
- Automatic instrumentation metrics
- Custom business metrics
- Infrastructure metrics
- Container metrics

### Log Aggregation
- Centralized log collection
- Structured logging with context
- Log correlation with traces
- Full-text search capabilities

![Features Demo](https://private-user-images.githubusercontent.com/143339000/522785959-e2331647-6aba-4fd7-82da-81271a065edd.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjQ5MTE3ODIsIm5iZiI6MTc2NDkxMTQ4MiwicGF0aCI6Ii8xNDMzMzkwMDAvNTIyNzg1OTU5LWUyMzMxNjQ3LTZhYmEtNGZkNy04MmRhLTgxMjcxYTA2NWVkZC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIwNVQwNTExMjJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mYTVmNDM5Y2E3MjllYWVhMDQ5ZjQ2ZDVmM2I3ZjkxNzFhMDc4YzliZTdlNTY2NmMwYzkyMTUwZDA0ZjlhN2ZhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.9ywiEv-nSfd7p9VQRDpY9aca-IXyPGQMI_xGSwvu-qo)

## Prerequisites

- Docker: Version 20.10+
- Docker Compose: Version 2.0+
- Linux Server: RHEL9, Ubuntu 20.04+, or similar
- RAM: Minimum 8GB (16GB recommended)
- CPU: 4+ cores recommended
- Disk: 20GB+ free space

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/dekema9924/Otel-demo-captsone.git
cd Otel-demo-captsone
```

### 2. Start the Stack

```bash
# Open or start Docker Desktop
# Start all services in detached mode
docker compose up -d

# Watch the logs (optional)
docker compose logs -f
```

### 3. Verify Deployment

```bash
# Check all containers are running
docker compose ps

# Expected output: All services should show "Up" status
```

![Docker Compose Up](./docs/images/docker-compose-up.png)

### 4. Access the Interfaces

| Service | URL | Default Credentials |
|---------|-----|---------------------|
| Grafana | http://localhost:3002 | admin / Danielekema#7 |
| Prometheus | http://localhost:9092 | - |
| ElasticSearch | http://localhost:9202 | - |
| OTel Demo | http://localhost:8082 | - |
| Jaeger UI | http://localhost:16686 | - |
| Load Generator | http://localhost:8089 | - |

### 5. Import Dashboards

1. Navigate to Grafana at http://localhost:3002
2. Go to Dashboards → Import
3. Upload dashboards from `grafana/dashboards/` directory
4. Select Prometheus and ElasticSearch as data sources

![Dashboard Import](./docs/images/dashboard-import.png)


## Dashboard Screenshots

### Service Overview Dashboard
Real-time health and performance metrics for all microservices.

![Service Overview](https://private-user-images.githubusercontent.com/143339000/522785959-e2331647-6aba-4fd7-82da-81271a065edd.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjQ5MTE3ODIsIm5iZiI6MTc2NDkxMTQ4MiwicGF0aCI6Ii8xNDMzMzkwMDAvNTIyNzg1OTU5LWUyMzMxNjQ3LTZhYmEtNGZkNy04MmRhLTgxMjcxYTA2NWVkZC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIwNVQwNTExMjJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mYTVmNDM5Y2E3MjllYWVhMDQ5ZjQ2ZDVmM2I3ZjkxNzFhMDc4YzliZTdlNTY2NmMwYzkyMTUwZDA0ZjlhN2ZhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.9ywiEv-nSfd7p9VQRDpY9aca-IXyPGQMI_xGSwvu-qo)

### Distributed Tracing View
Visualize complete request paths across services.

![Trace View]([./docs/images/trace-view.png](https://private-user-images.githubusercontent.com/143339000/522785931-18813b60-4dbf-4e71-b471-a12f10dc648b.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjQ5MTE3ODIsIm5iZiI6MTc2NDkxMTQ4MiwicGF0aCI6Ii8xNDMzMzkwMDAvNTIyNzg1OTMxLTE4ODEzYjYwLTRkYmYtNGU3MS1iNDcxLWExMmYxMGRjNjQ4Yi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIwNVQwNTExMjJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02Yjk3M2E3OTE4ZDIwOTdhYzkzYzIxMjVkNmU4MzlmZDhkNTdlOGFkYzA3MTFkM2ZhN2E2YWM1YzI2NTE1NjIwJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.N8BLuZj_zKG6aVzEJKdJL3h18yj56LK9Y2q1ZKg-Pu4))

### RED Metrics Dashboard
Monitor Rate, Errors, and Duration for critical services.

![RED Metrics](https://private-user-images.githubusercontent.com/143339000/522787244-c8a13ce5-f042-48a2-b55b-8b21c4fca8bf.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjQ5MTIwODQsIm5iZiI6MTc2NDkxMTc4NCwicGF0aCI6Ii8xNDMzMzkwMDAvNTIyNzg3MjQ0LWM4YTEzY2U1LWYwNDItNDhhMi1iNTViLThiMjFjNGZjYThiZi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIwNVQwNTE2MjRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0zNzk4MDZjNTA0NmU5MGZjN2U4NjhkMjkwYTBiYTMyODIwZWNhMzdlNTg4MmE3NzBjMTQ2YmYxYWY3NzYzZTAzJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.tAn1WveEB60T9UndI-EjGHfMfqgLkIUKENR0fq2CuQ4)

### Log Analysis
Centralized log exploration with filtering and correlation.

![Log Analysis]([./docs/images/log-analysis.png](https://private-user-images.githubusercontent.com/143339000/522787658-1105730e-10a1-432b-afe5-964a161407ca.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjQ5MTIyNTIsIm5iZiI6MTc2NDkxMTk1MiwicGF0aCI6Ii8xNDMzMzkwMDAvNTIyNzg3NjU4LTExMDU3MzBlLTEwYTEtNDMyYi1hZmU1LTk2NGExNjE0MDdjYS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIwNVQwNTE5MTJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jODY5ODRjZWE1OWJhMmU1MjM5ZmNkMDJjNTZhN2U2ZTNjZWIxYTEyZWEzODk4YWYyMzM2NjM4MjgyZjExYmUwJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.9fETmvurobJkDo2hOaK_NYwsQ4k1ireaGgg7B77PMSY))

### Infrastructure Metrics
Container and host-level resource monitoring.

![Infrastructure]([./docs/images/infrastructure-metrics.png](https://private-user-images.githubusercontent.com/143339000/522787874-72e9339d-1a22-4ed8-9b10-edce69c700a4.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjQ5MTIyNTIsIm5iZiI6MTc2NDkxMTk1MiwicGF0aCI6Ii8xNDMzMzkwMDAvNTIyNzg3ODc0LTcyZTkzMzlkLTFhMjItNGVkOC05YjEwLWVkY2U2OWM3MDBhNC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIwNVQwNTE5MTJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT00ZWY1NWJmMjNlOWEzYjMwYWUzOGYyNmIyN2M4YWE0ZjlkM2I1ZDcyODlkY2FhY2U5ODc5M2Q0NmUyNmZlZDU1JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.qrZp_bLSvtb4ghlQRJDxCBhjvBRF3BH-MOB8SXqW6wU))

## Configuration

### OpenTelemetry Collector

Located at `otelcol/otelcol-config.yml`:

```yaml
receivers:
  otlp:
    protocols:
      grpc:
        endpoint: 0.0.0.0:4317
      http:
        endpoint: 0.0.0.0:4318

exporters:
  prometheus:
    endpoint: "prometheus:9092"
  
  elasticsearch:
    endpoints: ["http://elasticsearch:9202"]
    logs_index: otel-logs
    traces_index: otel-traces

service:
  pipelines:
    metrics:
      receivers: [otlp]
      exporters: [prometheus]
    
    traces:
      receivers: [otlp]
      exporters: [elasticsearch]
    
    logs:
      receivers: [otlp]
      exporters: [elasticsearch]
```

### Prometheus Configuration

Located at `prometheus/prometheus.yml`:

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'otel-collector'
    static_configs:
      - targets: ['otelcol:8888']
  
  - job_name: 'demo-services'
    static_configs:
      - targets: ['frontend:8082']
```

### Docker Compose Networking

All services are connected via a custom bridge network for inter-container communication:

```yaml
networks:
  otel-network:
    driver: bridge
```

## Trace Testing

We use TraceTest to validate trace completeness and correctness.

### Running Trace Tests

```bash
# Execute trace tests
docker compose run tracetest test run \
  --definition-file /app/test/tracetesting/tracetest-provision.yaml
```

### What We Test

- Span creation and propagation
- Trace context preservation
- Service-to-service correlation
- Attribute completeness
- Error propagation
- Performance thresholds

![Trace Testing](./docs/images/trace-testing.png)

### Example Test Output

```
✓ Checkout Flow Test
  ✓ Trace has expected number of spans (12)
  ✓ All spans have parent relationships
  ✓ Critical path under 500ms
  ✓ No error spans detected
```

## Troubleshooting

### Common Issues

#### Containers Won't Start

```bash
# Check logs for specific service
docker compose logs elasticsearch

# Restart specific service
docker compose restart elasticsearch
```

#### Port Conflicts

```bash
# Check if ports are in use
sudo netstat -tulpn | grep -E '3002|9092|9202|8082|16686|8089'

# Modify ports in docker-compose.yaml if needed
```

#### ElasticSearch Memory Issues

```bash
# Increase vm.max_map_count on Linux
sudo sysctl -w vm.max_map_count=262144

# Make permanent
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
```

#### No Data in Grafana

1. Verify data sources are configured correctly
2. Check Prometheus is scraping metrics: http://localhost:9092/targets
3. Verify ElasticSearch has indices: `curl http://localhost:9202/_cat/indices`
4. Generate traffic to the demo app: http://localhost:8082

### Health Checks

```bash
# Check all service health
docker compose ps

# Test Prometheus
curl http://localhost:9092/-/healthy

# Test ElasticSearch
curl http://localhost:9202/_cluster/health

# Test Grafana
curl http://localhost:3002/api/health

# Test Jaeger
curl http://localhost:16686/
```

## Team Contributions

This project was a collaborative effort with contributions across multiple domains:

- Infrastructure Setup: Server provisioning and Docker configuration
- OTel Integration: Collector setup and instrumentation
- Backend Configuration: Prometheus and ElasticSearch setup
- Dashboard Design: Grafana dashboard creation and optimization
- Testing Framework: Trace validation and test automation
- Documentation: Technical writing and user guides

## Future Roadmap

### Short Term
- [ ] Add Jaeger UI as alternative trace viewer
- [ ] Implement Prometheus alerting rules
- [ ] Create custom metrics exporter for business KPIs
- [ ] Add SSL/TLS for production deployment

### Medium Term
- [ ] Migrate to Kubernetes deployment
- [ ] Implement Grafana Tempo for scalable tracing
- [ ] Add synthetic monitoring with k6
- [ ] Create CI/CD pipeline for dashboard updates

### Long Term
- [ ] Multi-cluster observability
- [ ] Machine learning-based anomaly detection
- [ ] Cost optimization recommendations
- [ ] Auto-remediation workflows

##  Additional Resources

- [OpenTelemetry Documentation](https://opentelemetry.io/docs/)
- [Grafana Dashboard Best Practices](https://grafana.com/docs/grafana/latest/dashboards/build-dashboards/best-practices/)
- [Prometheus Query Examples](https://prometheus.io/docs/prometheus/latest/querying/examples/)
- [ElasticSearch Index Management](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-management.html)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- OpenTelemetry Community for the demo application
- Grafana Labs for visualization tools
- Elastic for search and analytics
- Prometheus CNCF project

---

Built with care for modern observability

For questions or support, please open an issue on GitHub.
