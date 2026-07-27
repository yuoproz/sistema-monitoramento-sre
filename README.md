# 🖥️ Sistema de Monitoramento de Recursos & Alertas SRE

Um script automatizado em Bash para monitoramento contínuo de recursos críticos do sistema (Uso de Disco e Memória RAM), com geração de logs estruturados e envio de alertas em tempo real via Webhook do Discord.

---

## 🚀 Funcionalidades

* **Monitoramento Automático:** Coleta métricas de uso de disco (`df`) e memória RAM (`free`).
* **Sistema de Logging:** Registra todas as checagens com data, hora e severidade (`[INFO]` e `[ALERT]`) em arquivo local.
* **Alertas em Tempo Real:** Dispara notificações dinâmicas via **Discord Webhook** quando os limites críticos são ultrapassados.
* **Automação via Cron:** Agendamento para execução contínua em segundo plano no Linux.

---

## 🛠️ Tecnologias Utilizadas

* **Linux / WSL**
* **Bash Scripting** (`df`, `free`, `awk`, `curl`)
* **Discord Webhooks**
* **Cron** (Agendador de Tarefas)
* **Git & GitHub**

---

## 📌 Pré-requisitos

Antes de executar o script, certifique-se de ter os pacotes básicos instalados:

```bash
sudo apt update
sudo apt install curl cron -y

---

⚙️ Configuração e Execução
1. Clonar o repositório
git clone [https://github.com/yuoproz/sistema-monitoramento-sre.git](https://github.com/yuoproz/sistema-monitoramento-sre.git)
cd sistema-monitoramento-sre

2. Configurar o Webhook do Discord
Edite o arquivo monitoramento_final.sh e defina a variável:
DISCORD_WEBHOOK_URL="[https://discord.com/api/webhooks/SUA_URL_AQUI](https://discord.com/api/webhooks/SUA_URL_AQUI)"

3. Dar permissão de execução ao script
chmod +x monitoramento_final.sh

4. Executar manualmente
./monitoramento_final.sh

---

⏰ Agendamento com Crontab
Para rodar o monitoramento automaticamente a cada 5 minutos, adicione a seguinte linha ao seu crontab:
crontab -e

Adicione ao final do arquivo:
*/5 * * * * /caminho/completo/para/monitoramento_final.sh >> /caminho/completo/para/monitoramento.log 2>&1

---

📄 Exemplo de Log Gerado
2026-07-27 12:00:01 [INFO] Uso de Disco: 42% | Memoria RAM livre: 3420 MB - Sistema OK.
2026-07-27 12:05:01 [ALERT] ALERTA: Uso de disco em 88%! Limite critico atingido.
