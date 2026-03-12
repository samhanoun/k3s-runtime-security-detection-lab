#!/usr/bin/env bash
set -euo pipefail
NS=${1:-runtime-lab}
POD=$(kubectl get pods -n "$NS" -l app=sample-target -o jsonpath='{.items[0].metadata.name}')
echo "[+] Triggering sensitive file access attempt in pod $POD"
kubectl exec -n "$NS" "$POD" -- sh -c 'cat /etc/shadow >/dev/null 2>&1 || true'
echo "[+] Done. Check Falco alerts."
