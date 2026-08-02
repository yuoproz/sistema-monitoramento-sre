# 🖥️ Sistema de Monitoramento de Recursos & Alertas SRE

Um projeto completo de observabilidade e monitoramento em **Shell Script**, containerizado com **Docker** e orquestrado via **Docker Compose**, focado em práticas de **SRE, DevOps e DevSecOps**.

A aplicação realiza a coleta contínua de recursos críticos do sistema (Disco e Memória RAM), gerando logs estruturados e disparando alertas em tempo real via **Discord Webhook**.

---

## 🛠️ Tecnologias Utilizadas

- **Linux / WSL** & **Bash Scripting** (`df`, `free`, `awk`, `curl`)
- **Docker & Alpine Linux:** Imagem otimizada e *hardening* de segurança (execução com usuário não-root `appuser`).
- **Docker Compose:** Orquestração de containers, mapeamento de volumes e injeção de variáveis de ambiente.
- **DevSecOps & `.env`:** Gestão segura de segredos sem exposição de credenciais no repositório.
- **Discord Webhooks:** Notificações dinâmicas de alertas em tempo real.
- **Git & GitHub:** Versionamento e controle de qualidade de código.

---

## 🚀 Funcionalidades

- [x] **Coleta Automática:** Métricas de uso de disco e memória RAM.
- [x] **Logging Estruturado:** Registra todas as checagens com data, hora e severidade (`[INFO]` e `[ALERT]`).
- [x] **Alertas em Tempo Real:** Dispara notificações via Discord Webhook caso os limites críticos sejam ultrapassados.
- [x] **Persistência de Logs:** Mapeamento de volumes Docker (`./monitoramento.log`) para guardar os registros na máquina host.
- [x] **Isolamento e Segurança:** Container executado com usuário sem privilégios (`appuser`).

---

## ⚙️ Como Executar o Projeto

### Opção 1: Via Docker Compose (Recomendado) 🐳

**1. Clonar o repositório**
```bash
git clone https://github.com/yuoproz/sistema-monitoramento-sre.git
cd sistema-monitoramento-sre
```

**2. Configurar as Variáveis de Ambiente**

Crie um arquivo `.env` na raiz do projeto:
```bash
DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/SUA_URL_AQUI"
```

**3. Executar a aplicação**
```bash
docker compose up --build
```

---

### Opção 2: Execução Direta via Terminal / Cron 🐧

**1. Pré-requisitos**
```bash
sudo apt update
sudo apt install curl cron -y
```

**2. Dar permissão e executar manualmente**
```bash
chmod +x monitoramento_final.sh
./monitoramento_final.sh
```

**3. Agendamento com Crontab (Opcional)**
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
[2026-08-02 17:57:52] [INFO] === Iniciando Verificação de Rotina ===
[2026-08-02 17:57:52] [INFO] Uso de disco normal: 0%
[2026-08-02 17:57:52] [INFO] Uso atual de memória: 48%
[2026-08-02 17:57:52] [INFO] === Verificação Concluída ===
```

---

## 📸 Evidências de Funcionamento
