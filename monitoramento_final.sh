#!/bin/bash

# ==========================================
# Script de Monitoramento de Sistema
# Projeto 1 - Portfólio DevOps/SRE
# ==========================================

#definição do webhook do Discord para alertas
# DISCORD_WEBHOOK_URL="definida via arquivo .env"
# Parâmetros de Alerta (Limites em %)

DISK_LIMIT=80
LOG_FILE="monitoramento.log"
send_discord_alert() {
    local MESSAGE=$1
    curl -s -H "Content-Type: application/json" -X POST -d "{\"content\": \"🚨 **ALERTA DE MONITORAMENTO SRE:** $MESSAGE\"}" "$DISCORD_WEBHOOK_URL"
}
# Função para registrar logs formatados
log_message() {
    local LEVEL=$1
    local MESSAGE=$2
   local TIMESTAMP
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$TIMESTAMP] [$LEVEL] $MESSAGE" | tee -a "$LOG_FILE"
}

# 1. Checagem de Disco
check_disk() {
    local DISK_USAGE
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//')
    if [ "$DISK_USAGE" -ge "$DISK_LIMIT" ]; then
        local MSG="Uso de disco elevado: ${DISK_USAGE}% (Limite: ${DISK_LIMIT}%)"
        log_message "ALERT" "$MSG"
        send_discord_alert "$MSG"  # <-- ESSA LINHA É A CHAVE!
    else
        log_message "INFO" "Uso de disco normal: ${DISK_USAGE}%"
    fi
}

# 2. Checagem de Memória
check_memory() {
    # Calcula porcentagem de memória usada usando 'free'
    local MEM_USAGE

MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)

    log_message "INFO" "Uso atual de memória: ${MEM_USAGE}%"
}

# --- Execução Principal ---
log_message "INFO" "=== Iniciando Verificação de Rotina ==="
check_disk
check_memory
log_message "INFO" "=== Verificação Concluída ===" 
