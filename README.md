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

External resources:

- Dockerfile linter resource - [FROM:latest](https://www.fromlatest.io)

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

## BDD examples

Find in the `bdd-examples` directory of the repository some examples of BDD test created as part of the day 6 session.

To execute the tests:

1. Start a `duing` container with the repository shared as volume within it.

```console
docker run --name duing \
           -p 3389:3389 \
           --shm-size 1g \
           -dit --restart unless-stopped \
           -v $(pwd):/opt/docker-learning \
           kairops/duing
```

2. Copy the `/opt/docker-learning/bdd-examples/test/` directory in `/opt/duingdemo/ci-scripts/test/`. This will add the examples to the `features` directory.

```console
$ docker exec -u ubuntu duing cp -rv /opt/docker-learning/bdd-examples/test/ /opt/duingdemo/ci-scripts/
'/opt/docker-learning/bdd-examples/test/cucumber/features/step_definitions/bddfire_steps.rb' -> '/opt/duingdemo/ci-scripts/test/cucumber/features/step_definitions/bddfire_steps.rb'
'/opt/docker-learning/bdd-examples/test/cucumber/features/github_search.feature' -> '/opt/duingdemo/ci-scripts/test/cucumber/features/github_search.feature'
```

3. Follow the instructions of the [Duing](https://github.com/kairops/docker-ubuntu-xrdp-mate-custom/tree/master/duing) project.

Take care that github can't be tested with PhantomJS, so the `rake poltergeist` command will end with an error.

```console
ubuntu@7a0e1ec3060f:/opt/duingdemo/ci-scripts/test/cucumber$ rake poltergeist
/usr/bin/ruby2.5 -S bundle exec cucumber features -p poltergeist --format pretty --profile html -t ~@api
{"baseurl"=>"https://www.google.es", "take_screenshots"=>false, "screenshot_delay"=>1, "browser_width"=>1024}
Using the poltergeist and html profiles...
Feature: Google Search to explore BDDfire

  Scenario: View home page                      # features/bddfire.feature:4
    Given I am on "http://www.google.com?hl=en" # bddfire-3.0.2/lib/bddfire/web/web_steps.rb:2
    When I fill in "q" with the text "bddfire"  # bddfire-3.0.2/lib/bddfire/web/web_steps.rb:6
    Then I should see "Sign in"                 # bddfire-3.0.2/lib/bddfire/web/web_steps.rb:10

Feature: Github search for a library

  Scenario: Search library within github                # features/github_search.feature:3
    Given I am on "https://www.github.com"              # bddfire-3.0.2/lib/bddfire/web/web_steps.rb:2
      Request to 'https://www.github.com' failed to reach server, check DNS and/or server status (Capybara::Poltergeist::StatusFailError)
      features/github_search.feature:4:in `Given I am on "https://www.github.com"'
    When I fill in "Search GitHub" with the text "vavr" # bddfire-3.0.2/lib/bddfire/web/web_steps.rb:6
    And I press intro key with my little finger         # features/step_definitions/bddfire_steps.rb:3

Failing Scenarios:
cucumber -p poltergeist -p html features/github_search.feature:3 # Scenario: Search library within github

2 scenarios (1 failed, 1 passed)
6 steps (1 failed, 2 skipped, 3 passed)
0m1.410s
```
