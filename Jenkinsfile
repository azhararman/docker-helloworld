pipeline {
    agent any

    environment {
        IMAGE_NAME = "docker-helloworld"
        CONTAINER_NAME = "hello-container"
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${IMAGE_NAME}"
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Container Test') {
            steps {
                echo "Running container test: ${CONTAINER_NAME}"
                sh """
                    # Remove old container if exists
                    if [ \$(docker ps -a -q -f name=${CONTAINER_NAME}) ]; then
                        docker rm -f ${CONTAINER_NAME} || true
                    fi

                    # Run container
                    docker run --name ${CONTAINER_NAME} -d ${IMAGE_NAME} || exit 1

                    # Show logs
                    sleep 3
                    docker logs ${CONTAINER_NAME}

                    # Clean up
                    docker rm -f ${CONTAINER_NAME} || true
                """
            }
        }
    }

    post {
        always {
            echo 'Cleaning up Docker images (optional)'
            sh "docker rmi -f ${IMAGE_NAME} || true"
        }
        failure {
            echo 'Pipeline failed!'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
