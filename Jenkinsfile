pipeline {
    agent any
    environment {
        IMAGE_NAME = 'docker-helloworld:latest'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Run Container Test') {
            steps {
                sh 'docker run --rm $IMAGE_NAME'
            }
        }
    }
}
