pipeline {
    agent any

    stages {
        stage('Run Newman Collections') {
            agent {
                docker { 
                    image 'postman/newman:latest'
                    args '--user $(id -u):$(id -g)'
                }
            }
            steps {
                echo 'Running Collection 1...'
                sh '''
                    docker run --rm -v $PWD/collections:/etc/newman:ro postman/newman:latest \
                    run /etc/newman/collection1.json -r cli,junit \
                    --reporter-junit-export /etc/newman/results1.xml
                '''

                echo 'Running Collection 2...'
                sh '''
                    docker run --rm -v $PWD/collections:/etc/newman:ro postman/newman:latest \
                    run /etc/newman/collection2.json -r cli,junit \
                    --reporter-junit-export /etc/newman/results2.xml
                '''
            }
        }

        stage('Publish JUnit Reports') {
            steps {
                junit 'collections/results1.xml'
                junit 'collections/results2.xml'
            }
        }
    }
}
