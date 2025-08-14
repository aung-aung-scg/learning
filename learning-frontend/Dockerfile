# Use Node.js LTS version
FROM node:20-alpine

# Set working directory inside container
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port for the frontend
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
