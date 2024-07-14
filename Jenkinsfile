pipeline {
  agent any

  stages {
    stage('Pull code from GitHub') {
      steps {
        git(url: 'https://github.com/rail200/rail200-api', branch: 'develop')
      }
    }

//     stage('Build Docker image') {
//       steps {
//         script {
//           appBuild = docker.build("rail200/rail200-api")
//         }
//       }
//     }

    stage('Build and Push image to Docker Hub') {
      steps {
        script {
          docker.withRegistry("https://hub.docker.com/", 'docker-hub-credentials') {
            // Push Docker image to Docker Hub
            docker.build("${DOCKER_HUB_REPO}:${BUILD_NUMBER}").push()
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