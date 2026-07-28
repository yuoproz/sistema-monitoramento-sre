# 🖥️ Sistema de Monitoramento de Recursos & Alertas SRE

Um script automatizado em Bash para monitoramento contínuo de recursos críticos do sistema (Uso de Disco e Memória RAM), com geração de logs estruturados e envio de alertas em tempo real via Webhook do Discord.

---

## 🚀 Funcionalidades

- **Monitoramento Automático:** Coleta métricas de uso de disco (`df`) e memória RAM (`free`).
- **Sistema de Logging:** Registra todas as checagens com data, hora e severidade (`[INFO]` e `[ALERT]`) em arquivo local.
- **Alertas em Tempo Real:** Dispara notificações dinâmicas via **Discord Webhook** quando os limites críticos são ultrapassados.
- **Automação via Cron:** Agendamento para execução contínua em segundo plano no Linux.

---

## 🛠️ Tecnologias Utilizadas

- **Linux / WSL**
- **Bash Scripting** (`df`, `free`, `awk`, `curl`)
- **Discord Webhooks**
- **Cron** (Agendador de Tarefas)
- **Git & GitHub**

---

## 📌 Pré-requisitos

```bash
sudo apt update
sudo apt install curl cron -y
```

---

## ⚙️ Configuração e Execução

**1. Clonar o repositório**
```bash
git clone https://github.com/yuoproz/sistema-monitoramento-sre.git
cd sistema-monitoramento-sre
```

**2. Configurar o Webhook do Discord**
```bash
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/SUA_URL_AQUI"
```

**3. Dar permissão de execução**
```bash
chmod +x monitoramento_final.sh
```

**4. Executar manualmente**
```bash
./monitoramento_final.sh
```

---

## ⏰ Agendamento com Crontab

```bash
crontab -e
```

Adicione ao final do arquivo:
```bash
*/5 * * * * /caminho/completo/para/monitoramento_final.sh >> /caminho/completo/para/monitoramento.log 2>&1
```

---

## 📄 Exemplo de Log Gerado

```
[2026-07-28 18:43:02] [INFO] === Iniciando Verificação de Rotina ===
[2026-07-28 18:43:02] [ALERT] Uso de disco elevado: 85% (Limite: 80%)
[2026-07-28 18:43:02] [INFO] Uso atual de memória: 13%
[2026-07-28 18:43:02] [INFO] === Verificação Concluída ===
```


<img width="1015" height="198" alt="2" src="https://github.com/user-attachments/assets/4def4b23-eab1-4be2-a091-d8bbd56c0c41" />
<img width="661" height="137" alt="3" src="https://github.com/user-attachments/assets/c16b8fce-8020-4c16-80c0-e6c895189fe4" />
<img width="1434" height="277" alt="1" src="https://github.com/user-attachments/assets/4d4ee973-f3d5-47a1-9f6c-4ca5f2d8065a" />
