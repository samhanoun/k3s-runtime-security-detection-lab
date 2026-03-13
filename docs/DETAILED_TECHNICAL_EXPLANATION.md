# Detailed Technical Explanation — Project 2

## Project
**K3s Runtime Security & Detection Lab**

This document explains exactly what was implemented, why each control exists, and how to run/extend it.

---

## 1) Runtime Detection Rules (`detections/falco-rules/custom-rules.yaml`)

### Implemented rules
1. **Unexpected Shell In Container**
2. **Sensitive File Access In Container**
3. **Privileged Process Pattern**

### Why
These rules focus on behavior-based detection (runtime TTP-like patterns), not just static vulnerability reports.

### How to use
- Deploy Falco
- Load custom rules
- Run simulation scripts and validate that alerts are triggered

---

## 2) Attack Simulations (`simulations/attack-scenarios`)

### Scripts
- `01-shell-in-container.sh`
- `02-sensitive-path-attempt.sh`
- `03-privilege-pattern.sh`

### Purpose
Provide reproducible, controlled attack-like actions to validate the detection pipeline and runbooks.

### Why
Detection quality must be tested continuously; otherwise rules become theoretical.

---

## 3) Target Workload (`k8s/apps/sample-target.yaml`)

### What it deploys
- namespace `runtime-lab`
- deployment `sample-target`
- non-root container baseline with bounded resources

### Why
A predictable target workload is required to run repeatable simulations.

---

## 4) Runtime Baseline Policy (`k8s/policies/kyverno-runtime-baseline.yaml`)

### Enforced controls
- disallow privileged containers
- require non-root execution

### Why
Prevention and detection should be layered. Admission controls reduce trivial exploitation paths.

---

## 5) Incident Response Runbook (`runbooks/IR-CONTAINMENT.md`)

### Included phases
1. trigger criteria
2. triage
3. containment
4. evidence collection
5. eradication/recovery
6. post-incident review

### Why
Alerting without response process has low operational value.

---

## 6) Demo Orchestration (`scripts/demo-flow.sh`)

### Flow
1. deploy sample target
2. apply runtime baseline policy
3. execute simulation
4. follow response runbook

### Why
Supports live demonstrations/interviews with a deterministic sequence.

---

## 7) Documentation and Control Mapping

### Files
- `docs/IMPLEMENTATION_GUIDE.md`
- `docs/CONTROL-MAP.md`
- `README.md`

### Role
- Implementation guide: execution path
- Control map: preventive/detective/responsive control structure
- README: technical + recruiter-friendly framing

---

## 8) Suggested Next Enhancements

1. Add Falcosidekick routing (Slack/Webhook/Elasticsearch)
2. Add Loki + Grafana dashboards with severity and MTTD/MTTR panels
3. Add CI validation for Falco rules syntax/quality
4. Add MITRE ATT&CK tag mapping per rule
5. Add automated quarantine action behind approval gate

---

## 9) Interview-ready summary

> I implemented a Kubernetes runtime detection lab using behavior-based Falco rules, reproducible attack simulations, and response runbooks. The project demonstrates end-to-end detection engineering: rule design, validation, triage workflow, and containment operations.
