#!/bin/bash

set -euo pipefail

# @description Install stuff
#
# @example
#   install-stuff
#
# @arg $1 Task: "brief", "help" or "exec"
#
# @exitcode 0
#
# @stdout "Not implemented" message if the requested task is not implemented
#
function install-stuff() {

    # Init
    local briefMessage="Install stuff"
    helpMessage=$(cat <<EOF
Install all the stuff related with the learning:

* Download all docker images with "docker pull"
* Clona all repositories
* Build all project images

The material will be placed under a new directory "~/workspace/docker-learning"
EOF
)

    # Task choosing
    case $1 in
        brief)
            showBriefMessage "${FUNCNAME[0]}" "$briefMessage"
            ;;
        help)
            showHelpMessage "${FUNCNAME[0]}" "$helpMessage"
            ;;
        exec)
            # Create base directory and drive into it
            mkdir -p ~/workspace/
            mkdir ~/workspace/docker-learning
            cd ~/workspace/docker-learning || exit 1
            baseDir=$(pwd)
            mkdir day1 day2 day3 day4 day5 day6
            # Pull the docker images
            docker pull docker:dind
            docker pull php:7.1-fpm
            docker pull teecke/jenkins-dind:latest
            docker pull ruby:latest
            docker pull elgalu/selenium:latest
            docker pull nginx:latest
            docker pull ubuntu:latest
            docker pull sonarqube:latest
            docker pull mysql:5.7
            docker pull debian:jessie
            docker pull newtmitch/sonar-scanner:latest
            docker pull kairops/duing:latest
            docker pull sergioortegagomez/docker-ubuntu-cucumber:latest
            docker pull hello-world:latest
            # Clone the repositories by day
            git clone https://github.com/kairops/docker-learning
            git clone https://github.com/kairops/general-concepts
            cd "${baseDir}/day1" || exit 1
            git clone https://github.com/danielesiddi/docker-course
            cd "${baseDir}/day2" || exit 1
            git clone https://github.com/moncho/dry
            git clone https://github.com/red-panda-ci/jenkins-workshop
            cd "${baseDir}/day3" || exit 1
            git clone https://github.com/sergioortegagomez/red-panda-ci-symfony
            cd red-panda-ci-symfony || exit 1
            cp -pnv .env.dist .env || exit 1
            docker-compose build
            cd "${baseDir}/day4" || exit 1
            cd "${baseDir}/day5" || exit 1
            git clone https://github.com/docker-library/docker
            git clone https://github.com/red-panda-ci/jenkins-dind
            git clone https://github.com/red-panda-ci/jenkins-pipeline-library
            git clone https://github.com/informaticaph/PXGO_00064_2014_PHA
            git clone https://github.com/red-panda-ci/ubuntu-dind
            git clone https://github.com/aerokube/windows-images
            git clone https://github.com/zalando/zalenium
            cd "${baseDir}/day6" || exit 1
            git clone https://github.com/sergioortegagomez/docker-ubuntu-cucumber
            git clone https://github.com/kairops/docker-ubuntu-xrdp-mate-custom
            ;;
        *)
            showNotImplemtedMessage "$1" "${FUNCNAME[0]}"
            return 1
    esac
}

# Main
install-stuff "$@"