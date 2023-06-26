pipeline {
    agent any

    stages {
        stage('maven deployment') {
            steps {
                mvn deploy
            }
        }
        stage('building docker image') {
            steps {
                docker build -t spring-petclinic:$version_tag .
                docker run -d --name spring-petclinic spring-petclinic:$version_tag
                sleep 20
                docker ps -a
                docker stop spring-petclinic && docker rm spring-petclinic
                docker rmi spring-petclinic:$version_tag
            }
        }
    }
}
