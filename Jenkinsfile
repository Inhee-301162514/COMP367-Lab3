pipeline {
    agent any

    tools {
        jdk 'JDK21'
        maven 'MVN3'
    }

    environment {
        DockerHubPassword=credentials('DockerHubPassword')
    }

    stages {
        stage('check out') {
            steps {
                git branch: 'main', url: 'https://github.com/Inhee-301162514/COMP367-Lab3.git' 
            }
        }

        stage('build') {
            steps {
                withMaven(jdk: 'JDK21', maven: 'MVN3') {
                    bat 'mvn clean compile'
                }
            }
        }

        stage('Jacoco') {
            steps {
                jacoco(execPattern: '**/target/jacoco.exec')
            }
        }

        stage('Docker build') {
            steps {
                docker.build("alexpark19951122/comp367-lab3:lab3-build")
            }
        }

        stage('Docker login') {
            steps {
                bat 'docker login -u alexpark19951122 -p "%DockerHubPassword%"'
            }
        }

        stage('Docker push') {
            steps {
                bat 'docker push alexpark19951122/comp367-lab3:lab3-build'
            }
        }
    }
}
