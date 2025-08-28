pipeline {
    agent {
        docker { image 'postman/newman:latest' }
    }

    stages {
        stage('Install Newman') {
            steps {
                sh 'npm install -g newman'
            }
        }

        stage('Run Postman Collections') {
            steps {
                sh '''
                    newman run collections/collection1.json -r cli,junit --reporter-junit-export results1.xml
                    newman run collections/collection2.json -r cli,junit --reporter-junit-export results2.xml
                '''
            }
        }

        stage('Publish JUnit Reports') {
            steps {
                junit 'results1.xml'
                junit 'results2.xml'
            }
        }
    }
}
