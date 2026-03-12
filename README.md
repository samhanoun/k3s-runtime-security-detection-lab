# K3s Runtime Security & Detection Lab

A production-style portfolio lab that demonstrates runtime threat detection, triage, and response in Kubernetes (K3s).

## Executive Summary (Recruiter-Friendly)

This project simulates real-world Kubernetes attack behavior and proves how to detect and respond quickly using runtime telemetry.

It demonstrates three key capabilities:
1. **Prevention** (policy controls)
2. **Detection** (runtime alerts for suspicious activity)
3. **Response** (clear runbooks and containment steps)

**Business outcome:** reduced dwell time, faster response, and safer Kubernetes operations.

---

## What This Project Proves

- I can build a realistic cloud-native security lab, not just static policy files.
- I can detect behavior-based threats in containers (not only dependency CVEs).
- I can convert alerts into operational response with repeatable runbooks.
- I can communicate outcomes for technical and non-technical stakeholders.

---

## Core Components

- **K3s baseline manifests** (`k8s/apps`, `k8s/policies`)
- **Falco runtime detections** (`detections/falco-rules`)
- **Attack simulations** (`simulations/attack-scenarios`)
- **Incident response runbooks** (`runbooks`)
- **Detection dashboard blueprint** (`dashboards/grafana`)
- **CI policy validation** (`.github/workflows`)

---

## Demonstration Scenarios

### Scenario 1: Interactive shell in container
- Simulate shell spawn in workload pod
- Falco rule detects suspicious shell execution
- Trigger runbook for isolation and triage

### Scenario 2: Sensitive host path access
- Simulate attempt to access critical host files
- Falco raises high-severity alert
- Apply containment + evidence collection workflow

### Scenario 3: Privilege escalation behavior
- Simulate suspicious process execution pattern
- Detection pipeline tags as elevated risk
- Respond via namespace/workload controls

---

## How to Use

1. Deploy Falco + baseline policies (files in `k8s/`)
2. Apply custom Falco rules from `detections/falco-rules`
3. Run simulation scripts from `simulations/attack-scenarios`
4. Follow runbooks in `runbooks/`
5. Review dashboard/event outputs

See `docs/IMPLEMENTATION_GUIDE.md` for complete workflow.

---

## Portfolio/Interview Talking Points

- "I designed detection engineering around behavior and response, not only scanner output."
- "I implemented layered controls: admission policies + runtime detection + operational runbooks."
- "I can show measurable MTTD/response process improvement with reproducible simulations."
