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
            APP_IMAGE.push()
          }
        }
      }
    }

    stage("Run Docker image") {
      steps {
        sh "docker stop rail200 || true"
        sh "docker rm rail200 || true"
        sh "docker run -d --name rail200 -rm -p 9000:9000 rail200/rail200-api:latest"
//         script {
//           APP_IMAGE.withRun("-d -p 9000:9000")
//         }
      }
    }
  }
  environment {
    DOCKER_HUB_REPO = "rail200/rail200-api"
    APP_IMAGE = ""
  }
}