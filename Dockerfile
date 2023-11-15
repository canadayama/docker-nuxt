ARG NODE_VERSION=18

FROM node:${NODE_VERSION}-slim as base

ENV NODE_ENV=development
ENV HOST="0.0.0.0"
ENV PORT = 3000

WORKDIR /app

# Update npm
RUN npm install -g npm@latest

COPY ./src/package.json .
RUN npm install

# # Build
# FROM base as build

# COPY --link package.json package-lock.json .
# RUN npm install

# # Run
# FROM base

# COPY --from=build /app/node_modules /app/node_modules

# CMD ["npm", "run", "dev"]