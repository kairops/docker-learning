# Docker Learning

Docker Learning Course

Duration: Two weeks, three days per each week, 1 hour per day

## Week 1

Learning docker

### Day 1

Inception with docker basics

- Container execution and deatached execution
- Docker Development Flow
- CMD and ENTRYPOINT differences
- Pets vs Cattle
- Images
  - Layers
  - tags
  - docker public registry
- Builds
  - Dockerfile
  - Build, commit, push

Reference repositories:

- Daniele Siddi's GitHub - [Curso de introducción a Docker](https://github.com/danielesiddi/docker-course)

### Day 2

Docker Elements

- Containers
- Images
- Networks
- Volumes

Refertence repositories:

- Red Panda CI's GitHub - [Jenkins Workshop](https://github.com/red-panda-ci/jenkins-workshop)
- Moncho's Github - [DRY](https://github.com/moncho/dry) (container management CLI)

### Day 3

Docker Compose

- Docker compose file
- Parameters with .env
- Platform definition and usage
- Real examples with live projects

Reference repositories:

- Sergio Ortega Gome's GitHub - [Symfony 4 App Example](https://github.com/sergioortegagomez/red-panda-ci-symfony)

## Week 2

Using docker

### Day 4

Docker compose in real projects

Reference repositories: none that we can share :)

### Day 5

Docker in depth

- Docker in Docker
  - Ubuntu DIND
  - Official Docker in docker (official)
- Quality pieces with Docker
  - Jenkins in docker
  - Sonar with real live project

Reference repositories:

- Jerôme Petazzoni - [Using Docker in Docker](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)
- Red Panda CI's GitHub
  - [Ubuntu DIND](https://github.com/red-panda-ci/ubuntu-dind)
  - [Jenkins DIND](https://github.com/red-panda-ci/jenkins-dind)
  - [Jenkins Pipeline Library](https://github.com/red-panda-ci/jenkins-pipeline-library)
- Informática Parmadux's GitHub - [Odoo](https://github.com/informaticaph/PXGO_00064_2014_PHA)
- Docker - [Docker in Docker](https://hub.docker.com/_/docker)
- Zalando IT's GitHub - [Zalenium](https://github.com/zalando/zalenium)
- Aerokube's GitHub - [Windows Images](https://github.com/aerokube/windows-images)

### Day 6

BDD with Docker

Use the project [Duing](https://github.com/kairops/docker-ubuntu-xrdp-mate-custom/tree/master/duing) to dessign and execute a BDD test

Demonstrate how we can use Docker to run a complete linux Desktop environment with all the tools needed to materialize complex tasks.

Reference repositories:

- Kairop's GitHub - [Docker Ubuntu INstant Gherkin](https://github.com/kairops/docker-ubuntu-xrdp-mate-custom/tree/master/duing)
- Sergio Ortega Gomez's GitHub - [Docker Ubuntu 18.10 Mate Desktop](https://github.com/sergioortegagomez/docker-ubuntu-cucumber)

## Further reading

- [General Concepts](https://github.com/kairops/general-concepts/blob/master/es/toc.md) about Software Development (Spanish)

## Stuff Intallation

You can download the whole docker images and clone the whole referenced repositories with a script within the project.

Execute the command:

```console
devcontrol/actions/install-stuff.sh exec
```

...or use `devcontrol install-stuff` if you have [Devcontrol](https://github.com/teecke/devcontrol) installed on your system) and wait for the script to finish.
