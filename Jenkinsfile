pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
                    git credentialsId: 'git-creds', url: 'https://github.com/shankarprem12/testing.git'
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
