# Implementation Guide

## 1) Environment assumptions
- K3s cluster available
- kubectl access configured
- namespace-level deployment permissions

## 2) Deploy baseline controls
- Apply policies under `k8s/policies`
- Deploy sample vulnerable target app under `k8s/apps`

## 3) Deploy Falco stack
- Use `k8s/falco` manifests/helm values
- Load custom rules from `detections/falco-rules/custom-rules.yaml`

## 4) Run simulations
- Execute scripts in `simulations/attack-scenarios/`
- Validate that expected Falco rules trigger

## 5) Execute response runbook
- Use `runbooks/IR-CONTAINMENT.md`
- Isolate workload, collect forensic context, recover

## 6) Report outcomes
- Detection timeline
- Alert quality
- Containment effectiveness
- Recommended hardening follow-ups
