#!/usr/bin/env bash
set -euo pipefail
NS=${1:-runtime-lab}
POD=$(kubectl get pods -n "$NS" -l app=sample-target -o jsonpath='{.items[0].metadata.name}')
echo "[+] Triggering shell execution in pod $POD"
kubectl exec -n "$NS" "$POD" -- sh -c 'echo "simulation: shell exec"; /bin/sh -c "echo hi"'
echo "[+] Done. Check Falco alerts."
