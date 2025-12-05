# 🔭 OpenTelemetry Observability Dashboard

A comprehensive observability solution using OpenTelemetry, Grafana, Prometheus, and ElasticSearch to monitor distributed applications with full-stack visibility into metrics, traces, and logs.

![Project Banner](./docs/images/banner.png)

## 📑 Table of Contents

- [Overview](#-overview)
- [Architecture](#-architecture)
- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Dashboard Screenshots](#-dashboard-screenshots)
- [Configuration](#-configuration)
- [Trace Testing](#-trace-testing)
- [Troubleshooting](#-troubleshooting)
- [Team Contributions](#-team-contributions)
- [Future Roadmap](#-future-roadmap)
- [License](#-license)

## 🎯 Overview

This project implements a production-ready OpenTelemetry observability stack that provides complete visibility into distributed applications. Built on Docker and deployed on RHEL9, it demonstrates enterprise-grade monitoring using open-source tools.

### What This Project Offers

- **Full-Stack Observability**: Unified view of metrics, logs, and traces
- **Real-Time Monitoring**: Live dashboards with sub-second refresh rates
- **Distributed Tracing**: End-to-end request path visualization
- **Container-Ready**: Fully containerized with Docker Compose
- **Production Patterns**: Best practices for observability implementation

![Dashboard Overview](./docs/images/dashboard-overview.png)

## 🏗️ Architecture

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
| **OpenTelemetry Demo** | Generates realistic telemetry data | 8080 |
| **OTel Collector** | Receives and exports telemetry | 4317, 4318 |
| **Prometheus** | Time-series metrics storage | 9090 |
| **ElasticSearch** | Log and trace storage | 9200 |
| **Grafana** | Visualization and dashboards | 3000 |
| **Kibana** (optional) | ElasticSearch UI | 5601 |

## ✨ Features

### 🎨 Unified Dashboards
- **Service Health Overview**: Real-time status of all microservices
- **RED Metrics**: Rate, Errors, Duration for each service
- **Resource Utilization**: CPU, memory, and network metrics
- **Business Metrics**: Custom application-level KPIs

### 🔍 Distributed Tracing
- End-to-end request flow visualization
- Span-level performance analysis
- Service dependency mapping
- Error propagation tracking

### 📊 Metrics Collection
- Automatic instrumentation metrics
- Custom business metrics
- Infrastructure metrics
- Container metrics

### 📝 Log Aggregation
- Centralized log collection
- Structured logging with context
- Log correlation with traces
- Full-text search capabilities

![Features Demo](./docs/images/features-demo.gif)

## 🔧 Prerequisites

- **Docker**: Version 20.10+
- **Docker Compose**: Version 2.0+
- **Linux Server**: RHEL9, Ubuntu 20.04+, or similar
- **RAM**: Minimum 8GB (16GB recommended)
- **CPU**: 4+ cores recommended
- **Disk**: 20GB+ free space

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/dekema9924/Otel-demo-captsone.git
cd Otel-demo-captsone
```

### 2. Start the Stack

```bash
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
| **Grafana** | http://localhost:3000 | admin / admin |
| **Prometheus** | http://localhost:9090 | - |
| **ElasticSearch** | http://localhost:9200 | - |
| **OTel Demo** | http://localhost:8080 | - |

### 5. Import Dashboards

1. Navigate to Grafana at http://localhost:3000
2. Go to **Dashboards** → **Import**
3. Upload dashboards from `grafana/dashboards/` directory
4. Select Prometheus and ElasticSearch as data sources

![Dashboard Import](./docs/images/dashboard-import.png)

## 📸 Dashboard Screenshots

### Service Overview Dashboard
Real-time health and performance metrics for all microservices.

![Service Overview](./docs/images/service-overview.png)

### Distributed Tracing View
Visualize complete request paths across services.

![Trace View](./docs/images/trace-view.png)

### RED Metrics Dashboard
Monitor Rate, Errors, and Duration for critical services.

![RED Metrics](./docs/images/red-metrics.png)

### Log Analysis
Centralized log exploration with filtering and correlation.

![Log Analysis](./docs/images/log-analysis.png)

### Infrastructure Metrics
Container and host-level resource monitoring.

![Infrastructure](./docs/images/infrastructure-metrics.png)

## ⚙️ Configuration

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
    endpoint: "prometheus:9090"
  
  elasticsearch:
    endpoints: ["http://elasticsearch:9200"]
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
      - targets: ['frontend:8080']
```

### Docker Compose Networking

All services are connected via a custom bridge network for inter-container communication:

```yaml
networks:
  otel-network:
    driver: bridge
```

## 🧪 Trace Testing

We use TraceTest to validate trace completeness and correctness.

### Running Trace Tests

```bash
# Execute trace tests
docker compose run tracetest test run \
  --definition-file /app/test/tracetesting/tracetest-provision.yaml
```

### What We Test

- ✅ Span creation and propagation
- ✅ Trace context preservation
- ✅ Service-to-service correlation
- ✅ Attribute completeness
- ✅ Error propagation
- ✅ Performance thresholds

![Trace Testing](./docs/images/trace-testing.png)

### Example Test Output

```
✓ Checkout Flow Test
  ✓ Trace has expected number of spans (12)
  ✓ All spans have parent relationships
  ✓ Critical path under 500ms
  ✓ No error spans detected
```

## 🔍 Troubleshooting

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
sudo netstat -tulpn | grep -E '3000|9090|9200|8080'

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
2. Check Prometheus is scraping metrics: http://localhost:9090/targets
3. Verify ElasticSearch has indices: `curl http://localhost:9200/_cat/indices`
4. Generate traffic to the demo app: http://localhost:8080

### Health Checks

```bash
# Check all service health
docker compose ps

# Test Prometheus
curl http://localhost:9090/-/healthy

# Test ElasticSearch
curl http://localhost:9200/_cluster/health

# Test Grafana
curl http://localhost:3000/api/health
```

## 👥 Team Contributions

This project was a collaborative effort with contributions across multiple domains:

- **Infrastructure Setup**: Server provisioning and Docker configuration
- **OTel Integration**: Collector setup and instrumentation
- **Backend Configuration**: Prometheus and ElasticSearch setup
- **Dashboard Design**: Grafana dashboard creation and optimization
- **Testing Framework**: Trace validation and test automation
- **Documentation**: Technical writing and user guides

## 🗺️ Future Roadmap

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

## 📚 Additional Resources

- [OpenTelemetry Documentation](https://opentelemetry.io/docs/)
- [Grafana Dashboard Best Practices](https://grafana.com/docs/grafana/latest/dashboards/build-dashboards/best-practices/)
- [Prometheus Query Examples](https://prometheus.io/docs/prometheus/latest/querying/examples/)
- [ElasticSearch Index Management](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-management.html)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- OpenTelemetry Community for the demo application
- Grafana Labs for visualization tools
- Elastic for search and analytics
- Prometheus CNCF project

---

**Built with ❤️ for modern observability**

For questions or support, please open an issue on GitHub.
