pipeline {
    agent any

    environment {
        IMAGE_NAME = 'docker-helloworld:latest'
        CONTAINER_NAME = 'docker-helloworld-test'
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Checking out code from Git...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}"
                sh """
                    docker build -t ${IMAGE_NAME} .
                """
            }
        }

        stage('Run Container Test') {
            steps {
                echo "Running container test: ${CONTAINER_NAME}"
                sh """
                    # Remove existing test container if exists
                    if [ \$(docker ps -a -q -f name=${CONTAINER_NAME}) ]; then
                        docker rm -f ${CONTAINER_NAME}
                    fi
                    # Run container
                    docker run --name ${CONTAINER_NAME} -d ${IMAGE_NAME}
                    # Wait 5 seconds
                    sleep 5
                    # Show logs
                    docker logs ${CONTAINER_NAME}
                    # Stop and remove container
                    docker rm -f ${CONTAINER_NAME}
                """
            }
        }

    }

    post {
        always {
            echo 'Cleaning up Docker images (optional)'
            sh "docker rmi -f ${IMAGE_NAME} || true"
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
