# Readers' Haven Library

A five-page static website for Readers' Haven Library, built with Parcel and served by Nginx inside a Docker container.

## Pages
- Home (`index.html`)
- Collections (`collections.html`)
- Membership (`membership.html`)
- Services (`services.html`)
- Contact (`contact.html`)

## Project structure
- `src/`: HTML pages
- `styles/`: shared stylesheet
- `Dockerfile`: multi-stage build (Node builder, then Nginx runtime)

## Build locally
    npm ci
    npm run build

The site is generated in `dist/`.

## Run with Docker
    docker image build -t <dockerhub-username>/readers-haven:v2.0 .
    docker container run -d --name readers-haven -p 8081:80 <dockerhub-username>/readers-haven:v2.0

Open http://localhost:8081 in your browser.

## Workflow
Feature branches are created from `develop`, merged by pull request with approvals, then released from `release/v2.0` into `main`.