#!/usr/bin/env bash
set -euo pipefail

echo "[1/4] Deploy sample target"
kubectl apply -f k8s/apps/sample-target.yaml

echo "[2/4] Apply runtime baseline policies"
kubectl apply -f k8s/policies/kyverno-runtime-baseline.yaml || true

echo "[3/4] Run attack simulation"
./simulations/attack-scenarios/01-shell-in-container.sh runtime-lab

echo "[4/4] Follow runbook: runbooks/IR-CONTAINMENT.md"
