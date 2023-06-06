@Library('my-shared-library') _

pipeline{
    agent any 
    
    stages {
        stage("1. Git Checkout") {
            steps {
                script {
                    gitCheckout {
                        branch: 'main',
                        url: 'https://github.com/nasirpatel1957/mrdevops_java_app.git'
                }
            }
        }
    }
}