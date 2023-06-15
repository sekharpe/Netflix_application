# Base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and pnpm-lock.yaml files to the working directory
COPY package.json pnpm-lock.yaml ./

# Install project dependencies
RUN npm install -g pnpm
RUN pnpm install

# Copy the application code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Expose the container port
EXPOSE 3000

# Start the application
CMD [ "npm", "start" ]
