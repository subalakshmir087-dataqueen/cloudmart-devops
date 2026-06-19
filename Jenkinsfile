pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling code from GitHub...'
                checkout scm
            }
        }

        stage('Build orders-api image') {
            steps {
                echo 'Building Docker image...'
                dir('orders-api') {
                    sh 'docker build -t orders-api:v1 .'
                }
            }
        }
    }
}
