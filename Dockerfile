FROM alpine:3.19

RUN apk add --no-cache bash curl gawk procps

WORKDIR /app

COPY monitoramento_final.sh /app/monitoramento_final.sh

# Unifica a permissão e a criação do usuário em um único RUN
RUN chmod +x /app/monitoramento_final.sh && \
    adduser -D appuser

USER appuser

CMD ["/bin/bash", "/app/monitoramento_final.sh"]