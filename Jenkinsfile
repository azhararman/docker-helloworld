pipeline {
    agent any

    environment {
        IMAGE_NAME = "docker-helloworld"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image..."
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Run Container Test') {
            steps {
                echo "Running Docker Container..."
                bat 'docker run %IMAGE_NAME%'
            }
        }

    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
