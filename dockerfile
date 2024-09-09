# Use an official node image as the base
FROM node:14 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application code
COPY . ./

# Build the React app
RUN npm run build

# Use nginx to serve the content
FROM nginx:alpine

# Copy the build output to the nginx html directory
COPY --from=build /app/dist /usr/share/nginx/html


# Expose port 80
EXPOSE 80


# Start nginx
CMD ["nginx", "-g", "daemon off;"]                                                                                                                                                1,1           Top
