pipeline {
  agent any

  stages {
    stage('Pull code') {
      steps {
        git(url: 'https://github.com/rail200/rail200-api', branch: 'develop')
      }
    }

    node {
      def appBuild;

      stage('Build Docker image') {
        steps {
          script {
            appBuild = docker.build("rail200/rail200-api")
          }
        }
      }

      stage('Push to Docker Hub') {
        steps {
          script {
            docker.withRegistry("https://hub.docker.com") {
              // Push Docker image to Docker Hub
              appBuild.push("${BUILD_NUMBER}")
            }
          }
        }
      }
    }
  }
  environment {
    DOCKER_HUB_REPO = "rail200/rail200-api"
//     DOCKER_HUB_USERNAME = 'british.rail.200@gmail.com'
//     DOCKER_HUB_PASSWORD = 'britishrail1825'
  }
}