# Stage 1: Build the React app
FROM node:20-alpine AS builder

WORKDIR /app

COPY ./frontend/package.json ./frontend/package-lock.json* ./
RUN npm install

COPY ./frontend .

RUN npm run build


# Stage 2: Serve using Nginx
FROM nginx:alpine

# Copy built files from builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Replace default nginx config (optional)
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
