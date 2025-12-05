# OpenTelemetry Observability Dashboard

[![OpenTelemetry](https://img.shields.io/badge/OpenTelemetry-Enabled-blue)]()
[![Grafana](https://img.shields.io/badge/Grafana-Dashboard-orange)]()
[![Prometheus](https://img.shields.io/badge/Prometheus-Metrics-red)]()
[![ElasticSearch](https://img.shields.io/badge/ElasticSearch-Logs%20%26%20Traces-green)]()
[![Docker](https://img.shields.io/badge/Docker-Compose-informational)]()
[![Linux](https://img.shields.io/badge/Linux-RHEL9-critical)]()

A comprehensive observability solution using OpenTelemetry, Grafana, Prometheus, and ElasticSearch to monitor distributed applications with full-stack visibility into metrics, traces, and logs.

![Project Banner](https://private-user-images.githubusercontent.com/143339000/522785931-18813b60-4dbf-4e71-b471-a12f10dc648b.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjQ5MTE3ODIsIm5iZiI6MTc2NDkxMTQ4MiwicGF0aCI6Ii8xNDMzMzkwMDAvNTIyNzg1OTMxLTE4ODEzYjYwLTRkYmYtNGU3MS1iNDcxLWExMmYxMGRjNjQ4Yi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIwNVQwNTExMjJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02Yjk3M2E3OTE4ZDIwOTdhYzkzYzIxMjVkNmU4MzlmZDhkNTdlOGFkYzA3MTFkM2ZhN2E2YWM1YzI2NTE1NjIwJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.N8BLuZj_zKG6aVzEJKdJL3h18yj56LK9Y2q1ZKg-Pu4)

---

## Project Submission Links

**Course Deliverables - Quick Access:**

| # | Deliverable | Link |
|---|-------------|------|
| 1 | **MS Project .MPP File** | [Download MPP](./docs/submissions/OpenTelemetry_Project.mpp) |
| 2 | **MS Project Gantt Chart PDF (36"x48")** | [View Gantt Chart](./docs/submissions/Gantt_Chart_Poster.pdf) |
| 3 | **MS Project Resource Overview Report PDF** | [View Resource Report](./docs/submissions/Resource_Overview_Report.pdf) |
| 4 | **Updated Project Plan (DOCX & PDF)** | [DOCX](./docs/submissions/Project_Plan.docx) \| [PDF](./docs/submissions/Project_Plan.pdf) |
| 5 | **MS PowerPoint Presentation (.PPTX)** | [Download PPTX](./docs/submissions/Team_Presentation.pptx) |
| 6 | **Research Paper (DOCX & PDF)** | [DOCX](./docs/submissions/Research_Paper.docx) \| [PDF](./docs/submissions/Research_Paper.pdf) |
| 7 | **KSU Writing Center Review Proof** | [View Proof](./docs/submissions/Writing_Center_Review.pdf) |
| 8 | **Weekly Report Log (DOCX & PDF)** | [DOCX](./docs/submissions/Weekly_Reports.docx) \| [PDF](./docs/submissions/Weekly_Reports.pdf) |
| 9 | **Team Recording (MP4 & Teams Link)** | [Download MP4](./docs/submissions/Team_Recording.mp4) \| [Teams Link](https://ksu.sharepoint.com/YOUR_TEAMS_LINK) |

> **Note:** All deliverables meet the project requirements as outlined in the course syllabus. Research paper includes in-text citations and bibliography. Recording link is set to allow viewing by anyone within KSU.

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
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

![Dashboard Overview](https://private-user-images.githubusercontent.com/143339000/522785931-18813b60-4dbf-4
