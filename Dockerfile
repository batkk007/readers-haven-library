# Stage 1: build the static site using Node.js and Parcel
FROM node:22-alpine AS builder

# Set the working directory inside the build container
WORKDIR /app

# Copy only the dependency files first so the npm ci layer can be cached
COPY package*.json ./

# Install exact dependency versions from package-lock.json
RUN npm ci

# Copy the website source pages and the shared stylesheet
COPY src/ ./src/
COPY styles/ ./styles/

# Build all pages into /app/dist
RUN npm run build

# Stage 2: serve the built files with Nginx
FROM nginx:1.27-alpine

# Copy only the generated static files from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Document that Nginx listens on port 80
EXPOSE 80

# Run Nginx in the foreground so the container keeps running
CMD ["nginx", "-g", "daemon off;"]