@Library('my-shared-library') _

pipeline{
    agent any 

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose option')
    }

    stages {
        stage("1. Git Checkout") {
            when { expression { params.action == 'create' } }
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/nasirpatel1957/mrdevops_java_app.git"
            )
            }
        }

        stage("2. Maven Unit Test") {
            steps{
            when { expression { params.action == 'create' } }
                script{
                    mvnTest()
            }
        }
    }

        stage("3. Maven Integration Test") {
            steps{
            when { expression { params.action == 'create' } }
                script{
                    mvnIntegration()
            }
        }
    }

        stage("4. Static code analysis: Sonarqube") {
            steps{
            when { expression { params.action == 'create' } }
                script{
                    staticCodeAnalysis()
            }
        }
    }
}
}