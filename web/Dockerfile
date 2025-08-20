FROM node:22

# ===== 安装系统依赖 & Nginx =====
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    cron \
    gcc \
    make \
    autoconf \
    libc-dev \
    pkg-config \
    nginx \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ===== 安装 pnpm（如用 npm 可以跳过） =====
RUN corepack enable && corepack prepare pnpm@latest --activate

# ===== 配置 Nginx 默认站点 =====
RUN rm /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/conf.d/default.conf

# ===== Node + Nginx 共享工作目录 =====
WORKDIR /var/www/html

# 将当前目录所有文件复制到容器内的 /var/www/html
COPY . .

# ===== 安装依赖 =====
RUN pnpm i

# ===== 执行构建命令 =====
RUN pnpm build-only


# ===== 启动脚本 =====
COPY docker-start.sh /usr/local/bin/docker-start.sh
RUN chmod +x /usr/local/bin/docker-start.sh
RUN chmod -R 777 /var/www/html
# ===== 暴露端口 =====
EXPOSE 80

# ===== 容器启动时运行 Nginx 和 Node =====
CMD ["sh","/usr/local/bin/docker-start.sh"]