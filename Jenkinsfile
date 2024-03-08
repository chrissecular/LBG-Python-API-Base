pipeline {
    agent any
    environment{
        set -e
        DOCKER_IMAGE = "lbg"
        VERSION = "1.3"
        PORT = "8000"
    }
    stages {
        stage('Prep'){
            steps {
                sh '''
                chmod +x setup.sh
                ./setup.sh
                cleanup
                '''
            }
        }
        stage('Build') {
            steps {
                sh "./setup.sh"
                sh "cleanup"
                sh "build_docker"
           }
        }
         stage('Deploy') {
            steps {
                sh '''
                ./setup.sh
                run_docker
                '''
                }
        }   
    }
}
