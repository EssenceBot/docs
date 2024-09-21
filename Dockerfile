FROM squidfunk/mkdocs-material as build

WORKDIR /docs

COPY . .

RUN mkdocs build



FROM nginx:stable-alpine-slim as serve

COPY --from=build /docs/site /usr/share/nginx/html