pipeline {
    agent {
        docker { image 'python' }
    }

    stages {
        stage('Start') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Run API Tests') {
            steps {
                sh 'cd backend && robot -d ./log/suittestsAPI ./tests'
            }
        }
        stage('Run UI Tests') {
            steps {
                sh 'cd frontend && robot -d ./log/suittestUI ./tests'
            }
        }
    }
}
