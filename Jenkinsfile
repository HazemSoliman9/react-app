pipeline {
    agent any

    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    stages {
        
        stage('Test'){
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage('Linting') {
            steps {
                script {
                sh 'npm run lint'    
                }
            }
        }

        stage('E2E Testing') {
            steps {
                sh 'npm run teste2e'
            }
        }
        
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }


        stage('Deploy Image') {
            steps {
                sh 'ansible-playbook playbook.yml'
            }
        }
    }
}
