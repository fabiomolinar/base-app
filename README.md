# base-app

A base app with standard configurations and a technology stack already predefined to be used as a base to spin new web apps.

## Technology stack

The list below contains a list of technologies to be used (at least for now) as a base to develop new web applications.

- Containerization
  - Docker
- Back-end
  - Meteor
- Front-end
  - React
  - Bootstrap
- Testing
  - Mocha
  - Chai
- Documentation
  - JSDoc
- Automation
  - Jenkins

## Building the docker image

`docker build -t username/image_name:tag_name .`

If behind a proxy:

`docker build -t username/image_name:tag_name . --build-arg HTTP_PROXY=165.225.68.34:18000`

## Runing a node container

`docker run -p 3000:3000 -it --rm --name container-name image-name`

## Connecting to a running container

`docker exec -it container-name bash`

While connected, to exit simple use `exit`.