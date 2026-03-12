# Incident Response Runbook: Container Threat

## Trigger
Falco high-severity alert (shell/hostpath/escalation behavior)

## Steps
1. Identify impacted workload/pod/namespace
2. Snapshot pod metadata and recent logs
3. Contain:
   - label namespace for quarantine policy
   - scale suspicious deployment to zero if needed
4. Preserve evidence:
   - events, pod describe, container logs, Falco alert payload
5. Eradicate:
   - rotate credentials/secrets if exposure suspected
   - redeploy known-good image with signed digest
6. Recover and monitor
7. Post-incident review and control tuning

## Evidence commands (examples)
- kubectl get events -n <ns> --sort-by=.lastTimestamp
- kubectl logs <pod> -n <ns> --previous
- kubectl describe pod <pod> -n <ns>
