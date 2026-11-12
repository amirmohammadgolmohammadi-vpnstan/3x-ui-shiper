FROM alpine:3.19

ARG XUI_VERSION=v3.9.0
ARG ARCH=amd64

ENV TZ=Asia/Tehran

RUN apk add --no-cache \
    curl \
    bash \
    ca-certificates \
    tzdata \
    sqlite \
    tar \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && mkdir -p /etc/x-ui /var/log/x-ui

RUN curl -fSL "https://github.com/mhsanaei/3x-ui/releases/download/${XUI_VERSION}/x-ui-linux-${ARCH}.tar.gz" \
    -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /usr/local/ \
    && rm -f /tmp/x-ui.tar.gz \
    && test -x /usr/local/x-ui/x-ui \
    && chmod +x /usr/local/x-ui/x-ui.sh \
    && chmod -R +x /usr/local/x-ui/bin/ \
    && if [ -f "/usr/local/x-ui/bin/xray-linux-${ARCH}" ]; then \
         ln -sf "xray-linux-${ARCH}" /usr/local/x-ui/bin/xray; \
       elif [ -f /usr/local/x-ui/bin/xray ]; then \
         ln -sf xray /usr/local/x-ui/bin/xray-linux-${ARCH}; \
       fi

WORKDIR /usr/local/x-ui

# 3x-ui's default web panel port.
# Configure the same target port in the Shiper project settings if requested.
EXPOSE 2053

CMD ["/usr/local/x-ui/x-ui"]
