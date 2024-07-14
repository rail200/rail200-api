pipeline {
  agent any
  stages {
    stage('Pull code') {
      steps {
        git url: 'https://github.com/rail200/rail200-api', branch: 'develop'
      }
    }
  }
}