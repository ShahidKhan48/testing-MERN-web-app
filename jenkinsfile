pipeline {
    agent any
    
    environment {
        // Define environment variables if necessary
        NODE_ENV = 'production'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from GitHub
                git 'https://github.com/ShahidKhan48/testing-MERN-web-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install Node.js and NPM dependencies for both frontend and backend
                script {
                    sh 'npm install -g npm@latest'  // Update npm to latest version
                    dir('frontend') {
                        sh 'npm install'  // Install React app dependencies
                    }
                    dir('backend') {
                        sh 'npm install'  // Install Node.js/Express dependencies
                    }
                }
            }
        }

        stage('Build Frontend') {
            steps {
                // Build the React app
                dir('frontend') {
                    sh 'npm run build'  // Build React app
                }
            }
        }

        stage('Build Backend') {
            steps {
                // Build or start the backend (Node.js/Express)
                dir('backend') {
                    sh 'npm run build'  // Optional: if you have a build script for the backend
                    sh 'npm start &'  // Start the backend server
                }
            }
        }

        stage('Deploy to NGINX') {
            steps {
                // Copy built frontend files to NGINX server
                script {
                    sh 'sudo cp -r frontend/build/* /usr/share/nginx/html/'  // Adjust path as per your NGINX config
                    sh 'sudo systemctl restart nginx'  // Restart NGINX to apply changes
                }
            }
        }
    }

    post {
        always {
            // Clean up or notify after the build
            echo 'Build completed'
        }
    }
}
