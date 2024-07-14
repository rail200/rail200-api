pipeline {

  agent any

  environment {
      DOCKER_HUB_USERNAME = credentials('docker-hub-username')
      DOCKER_HUB_PASSWORD = credentials('docker-hub-password')
      DOCKER_HUB_REPO = 'rail200/rail200-api'
    }

  stages {

    stage('Pull code') {
      steps {
        git url: 'https://github.com/rail200/rail200-api', branch: 'develop'
      }
    }

    stage('Build Docker image') {
      steps {
        script {
          // Build Docker image using Dockerfile with Maven commands
          docker.build("rail200", ".")
        }
      }
    }

     stage('Push to Docker Hub') {
       steps {
         script {
           // Log in to Docker Hub
           docker.withRegistry('https://registry.hub.docker.com', DOCKER_HUB_USERNAME, DOCKER_HUB_PASSWORD) {
             // Push Docker image to Docker Hub
             docker.image("rail200").push("${DOCKER_HUB_REPO}:${BUILD_NUMBER}")
           }
         }
       }
     }
  }
}