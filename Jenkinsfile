pipeline {
  agent any

  stages {
    stage('Pull code from GitHub') {
      steps {
        git(url: 'https://github.com/rail200/rail200-api', branch: 'develop')
      }
    }

    stage('Build Docker image') {
      steps {
        script {
          APP_IMAGE = docker.build("rail200/rail200-api")
        }
      }
    }

    stage('Push image to Docker Hub') {
      steps {
        script {
          docker.withRegistry("", 'docker-hub-credentials') {
            // Push Docker image to Docker Hub
            APP_IMAGE.build("${DOCKER_HUB_REPO}:${BUILD_NUMBER}").push()
          }
        }
      }
    }
  }
  environment {
    DOCKER_HUB_REPO = "rail200/rail200-api"
    APP_IMAGE = ""
  }
}