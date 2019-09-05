#!groovy

@Library('github.com/red-panda-ci/jenkins-pipeline-library@v3.1.6') _

// Initialize global config
cfg = jplConfig('docker-learning', 'doc', '', [slack: '#integrations', email:'redpandaci+docker-learning@gmail.com'])

pipeline {
    agent none

    stages {
        stage ('Initialize') {
            agent { label 'docker' }
            steps  {
                jplStart(cfg)
            }
        }
        stage ('Bash linter') {
            steps {
                script {
                    sh "devcontrol run-bash-linter"
                }
            }
        }
        stage ('Make release') {
            agent { label 'docker' }
            when { branch 'release/new' }
            steps  {
                jplMakeRelease(cfg, true)
            }
        }
    }

    post {
        always {
            jplPostBuild(cfg)
        }
    }

    options {
        timestamps()
        ansiColor('xterm')
        buildDiscarder(logRotator(artifactNumToKeepStr: '20',artifactDaysToKeepStr: '30'))
        disableConcurrentBuilds()
        timeout(time: 1, unit: 'DAYS')
    }
}
