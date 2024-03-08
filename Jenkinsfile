pipeline {
    agent any
    environment{
                DOCKER_IMAGE = "lbg"
        VERSION = "1.3"
        PORT = "8000"
    }
    stages {
        stage('prep'){
            steps{
                sh '''
                docker stop $(docker ps -q) || true
                docker rm $(docker ps -aq) || true
                docker rmi $(docker images -q) || true
                '''
            }
        }
        stage('Build') {
            steps {
                sh '''
                 docker build -t $DOCKER_IMAGE:$VERSION .
                '''
           }
        }
         stage('Deploy') {
            steps {
                sh '''
                docker run  -d -p 80:$PORT -e PORT=$PORT $DOCKER_IMAGE:$VERSION
                '''
                }
        }   
    }
}
