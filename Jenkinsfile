pipeline {
    agent any

    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    stages {
        stage('Build Start Notification') {
            steps {
                script {
                    slackSend( message: "Build Started - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)")
                }
            }
        }
        
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
    post {
        success {
            // Send notification for successful build
            slackSend(color: 'good', message: "Build successful: ${currentBuild.fullDisplayName}")
        }
        failure {
            // Send notification for failed build
            slackSend(color: 'danger', message: "Build failed: ${currentBuild.fullDisplayName}")
        }
    }
}
