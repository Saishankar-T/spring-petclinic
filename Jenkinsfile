pipeline {
    agent any

    stages {
        stage('maven deployment') {
            steps {
                sh 'mvn deploy'
            }
        }
        stage('building docker image') {
            steps {
                sh 'docker build -t spring-petclinic:${version_tag} .'
                sh 'docker run -d --name spring-petclinic spring-petclinic:${version_tag}'
                sh 'sleep 20'
                sh 'docker ps -a'
                sh 'docker stop spring-petclinic && docker rm spring-petclinic'
                sh 'docker rmi spring-petclinic:${version_tag}'
            }
        }
    }
}
