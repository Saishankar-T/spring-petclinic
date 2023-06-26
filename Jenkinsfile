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
                sh 'docker build -t saishankar237/spring-petclinic:${version_tag} .'
            }
        }
        stage('running docker container'){
            steps{
                sh 'docker run -d --name spring-petclinic saishankar237/spring-petclinic:${version_tag}'
                sh 'sleep 20'
            }
        }
        stage('pushing docker image o docker hub'){
            steps{
                sh 'docker push saishankar237/spring-petclinic:${version_tag}'
            }
        }
        stage('removing docker image and container'){
            steps{
                sh 'docker stop spring-petclinic && docker rm spring-petclinic'
                sh 'docker rmi saishankar237/spring-petclinic:${version_tag}'
            }    
        }
    }
}
