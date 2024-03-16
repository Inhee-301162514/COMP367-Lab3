pipeline {
    agent any

    tools {
        maven 'MAVEN3'
    }

    stages {
        stage('Build') {
            steps {
                sh "mvn clean compile"
            }
            post {
                success {
                    sh "nohup mvn tomcat7:run &"
                }
            }
        }
    }
}
