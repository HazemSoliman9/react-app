pipeline {
    agent any

    stages {
        stage('Build & Push Image') {
            steps {
                sh 'ansible-playbook playbook.yml'
            }
        }
    }
}
