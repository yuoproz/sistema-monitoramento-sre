```bash
#!/bin/bash

set -Eeuo pipefail

DISK_LIMIT=80
MEMORY_LIMIT=80
CPU_LIMIT=80
LOG_FILE="monitoramento.log"

if [ -f ".env" ]; then
    source .env
fi

log_message() {
    local level="$1"
    local message="$2"
    local timestamp

    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
}

send_discord_alert() {
    local message="$1"

    [ -z "${DISCORD_WEBHOOK_URL:-}" ] && return 0

    curl -fsS \
        -H "Content-Type: application/json" \
        -X POST \
        -d "{\"content\":\"🚨 **ALERTA SRE:** $message\"}" \
        "$DISCORD_WEBHOOK_URL" >/dev/null
}

check_disk() {
    local usage

    usage=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

    if [ "$usage" -ge "$DISK_LIMIT" ]; then
        local message="Uso de disco elevado: ${usage}% (limite: ${DISK_LIMIT}%)"
        log_message "ALERT" "$message"
        send_discord_alert "$message"
    else
        log_message "INFO" "Uso de disco: ${usage}%"
    fi
}

check_memory() {
    local usage

    usage=$(free | awk '/Mem:/ {printf "%.0f", ($3/$2) * 100}')

    if [ "$usage" -ge "$MEMORY_LIMIT" ]; then
        local message="Uso de memória elevado: ${usage}% (limite: ${MEMORY_LIMIT}%)"
        log_message "ALERT" "$message"
        send_discord_alert "$message"
    else
        log_message "INFO" "Uso de memória: ${usage}%"
    fi
}

check_cpu() {
    local usage

    usage=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%.0f", 100 - $8}')

    if [ "$usage" -ge "$CPU_LIMIT" ]; then
        local message="Uso de CPU elevado: ${usage}% (limite: ${CPU_LIMIT}%)"
        log_message "ALERT" "$message"
        send_discord_alert "$message"
    else
        log_message "INFO" "Uso de CPU: ${usage}%"
    fi
}

log_message "INFO" "Iniciando monitoramento"

check_disk
check_memory
check_cpu

log_message "INFO" "Monitoramento concluído"
```
