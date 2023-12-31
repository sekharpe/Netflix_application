# Base image as shown below ok
FROM node:16.14-alpine

# Set the working directory inside the container to show the contents
WORKDIR /app

# Copy the package.json and pnpm-lock.yaml files to the working directory
COPY package.json pnpm-lock.yaml ./

# Install project dependencies
RUN npm install -g pnpm
RUN pnpm install

# Copy the application code to the working directory
COPY . .

# Build the React app as mentioned below
RUN npm run build

# Expose the container port
EXPOSE 3000

# Start the application
CMD [ "npm", "start" ]
