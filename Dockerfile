FROM kong:latest
COPY kong.yml /usr/local/kong/declarative/kong.yml
ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/kong.yml
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr
# Escuchar en todas las interfaces
ENV KONG_PROXY_LISTEN=0.0.0.0:8000
ENV KONG_ADMIN_LISTEN=0.0.0.0:8001

# HTTPS Config
ENV KONG_TRUSTED_IPS=0.0.0.0/0,::/0
ENV KONG_REAL_IP_HEADER=X-Forwarded-For

USER kong
