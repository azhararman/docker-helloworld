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
