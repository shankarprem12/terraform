pipeline {
    agent any
    parameters {
        string(name: 'gitbranch', defaultValue: 'master', description: 'select which branch do you want')
    }

    stages {
        stage('checkout code') {
            steps {
                script {
                    git branch: "${params.gitbranch}", credentialsId: 'git-creds', url: 'https://github.com/shankarprem12/terraform.git'
                }
            }
        }
        stage('Run test cases') {
            steps {
                bat """
                mvn test allure:report
                """ 
            }
        }
    }
}
