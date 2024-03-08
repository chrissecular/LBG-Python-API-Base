pipeline {
    agent any
    environment{
        set -e
        DOCKER_IMAGE = lbg
        VERSION = "1.3"
        PORT = "8000"
    }
    stages {
        stage('Build') {
            steps {
                sh "sh setup.sh"
                sh "cleanup"
                sh "build_docker"
           }
        }
         stage('Deploy') {
            steps {
                sh '''
                sh setup.sh
                run_docker
                '''
                }
        }   
    }
}
