pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
                   git branch: 'master', credentialsId: 'git-creds', url: 'https://github.com/shankarprem12/terraform.git'
                }
            }
        }
        stage('Checkout') {
            steps {
                script {
                   sh """
                   echo hey there prem noob
                   """
                }
            }
        }
    }
    post {
        success {
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'terraform.tf', reportName: 'HTML Report', reportTitles: ''])
        }
    }
}
