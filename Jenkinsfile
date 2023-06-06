@Library('my-shared-library') _

pipeline{
    agent any 

    stages {
        stage("1. Git Checkout") {
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/nasirpatel1957/mrdevops_java_app.git"
            )
            }
        }

        stage("2. Maven Unit Test") {
            steps{
                script{
                    mvnTest()
            }
        }
    }

        stage("3. Maven Integration Test") {
            steps{
                script{
                    mvnIntegration()
            }
        }
    }
}
}