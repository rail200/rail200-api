pipeline {
  agent any
  environment {
    GIT_CREDENTIALS_ID = 'github-access-token'
  }
  stages {
    stage('Pull code') {
      steps {
        git 'https://github.com/rail200/rail200-api', branch: 'develop', credentialsId: ${GIT_CREDENTIALS_ID}
      }
    }
  }
}