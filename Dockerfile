# Dockerfile

# frontend
FROM node:18 AS frontend
WORKDIR /app
COPY bluemed/ ./ 
RUN npm install
RUN npm run build

# backend
FROM node:18 AS backend
WORKDIR /app
COPY express/ ./               
COPY --from=frontend /app/dist ./dist 
RUN npm install

# expose port and run server
EXPOSE 3000
CMD ["node", "index.js"]
