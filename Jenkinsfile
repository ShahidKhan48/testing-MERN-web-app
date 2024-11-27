pipeline {
    agent any

    environment {
        // Set the necessary environment variables
        DOCKER_COMPOSE_VERSION = '1.29.2'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from GitHub
                git branch: 'main', url: 'https://github.com/ShahidKhan48/testing-MERN-web-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Ensure Docker and Docker Compose are installed
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y docker.io'
                    sh 'sudo curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
                    sh 'sudo chmod +x /usr/local/bin/docker-compose'
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    // Build frontend, backend, and nginx images using Docker Compose
                    sh 'docker-compose build'
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    // Start the containers using Docker Compose
                    sh 'docker-compose up -d'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Verify if the containers are running correctly
                    sh 'docker ps'
                }
            }
        }

        stage('Post Deployment Cleanup') {
            steps {
                script {
                    // Stop and remove containers after verification
                    sh 'docker-compose down'
                }
            }
        }
    }

    post {
        always {
            // Clean up resources or send notifications
            echo 'Pipeline execution finished.'
        }
    }
}
