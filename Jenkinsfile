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
        when { expression { params.action == 'create' } }
            steps{
                script{
                    mvnTest()
            }
        }
    }

        stage("3. Maven Integration Test") {
        when { expression { params.action == 'create' } }
            steps{
                script{
                    mvnIntegration()
            }
        }
    }

    stage('4. Static code analysis: Sonarqube'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   
                   def SonarQubecredentialsId = 'sonar-api'
                   statiCodeAnalysis(SonarQubecredentialsId)
               }
            }
        }
}
}