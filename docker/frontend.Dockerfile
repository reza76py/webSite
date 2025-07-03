# docker/frontend.Dockerfile (for development)

FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY ./frontend/package.json ./frontend/package-lock.json* ./
RUN npm install

# Copy the rest of the frontend code
COPY ./frontend .

# Expose Vite dev server port
EXPOSE 5173

# Start Vite dev server with host binding (for external access)
CMD ["npm", "run", "dev", "--", "--host"]
