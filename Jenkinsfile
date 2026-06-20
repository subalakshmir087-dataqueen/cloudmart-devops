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
                dir('orders-api') {
                    sh 'docker build -t orders-api:v1 .'
                }
            }
        }
        stage('Build inventory-api image') {
            steps {
                dir('inventory-api') {
                    sh 'docker build -t inventory-api:v1 .'
                }
            }
        }
        stage('Scan orders-api with Trivy') {
            steps {
                sh 'trivy image --severity CRITICAL,HIGH --exit-code 1 orders-api:v1'
            }
        }
        stage('Scan inventory-api with Trivy') {
            steps {
                sh 'trivy image --severity CRITICAL,HIGH --exit-code 1 inventory-api:v1'
            }
        }
    }
}
