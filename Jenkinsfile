stage('Run Container Test') {
    steps {
        echo "Running container test: ${CONTAINER_NAME}"
        sh """
            # Remove old container
            docker rm -f ${CONTAINER_NAME} || true

            # Run container and execute Java program
            docker run --name ${CONTAINER_NAME} ${IMAGE_NAME}

            # Clean up
            docker rm -f ${CONTAINER_NAME} || true
        """
    }
}
