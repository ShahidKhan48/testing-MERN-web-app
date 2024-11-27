pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_VERSION = '1.29.2' // Adjust to the version you want
    }

    stages {
        stage('Install Dependencies') {
            steps {
                script {
                    // Ensure Docker Compose is installed
                    sh '''
                    if ! command -v docker-compose &> /dev/null
                    then
                        echo "docker-compose not found, installing..."
                        sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                        sudo chmod +x /usr/local/bin/docker-compose
                    fi
                    '''
                }
            }
        }
        stage('Build Docker Images') {
            steps {
                script {
                    // Build the Docker images using docker-compose
                    sh 'docker-compose build'
                }
            }
        }
        stage('Run Docker Compose') {
            steps {
                script {
                    // Run the Docker Compose containers
                    sh 'docker-compose up -d'
                }
            }
        }
        stage('Verify Deployment') {
            steps {
                script {
                    // Verify that containers are running
                    sh 'docker ps'
                }
            }
        }
    }
}
