@Library('my-shared-library') _

pipeline{
    agent any 

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose option')
        string(name: "hubUser", description: "Dockerhub UserName", defaultValue: "nhp1993")
        string(name: "project", description: "Project Name", defaultValue: "java-app")
        string(name: "version", description: "Version Name", defaultValue: "v1")
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

    //     stage("2. Maven Unit Test") {
    //     when { expression { params.action == 'create' } }
    //         steps{
    //             script{
    //                 mvnTest()
    //         }
    //     }
    // }

    //     stage("3. Maven Integration Test") {
    //     when { expression { params.action == 'create' } }
    //         steps{
    //             script{
    //                 mvnIntegration()
    //         }
    //     }
    // }

    //     stage('4. Static code analysis: Sonarqube'){
    //      when { expression {  params.action == 'create' } }
    //         steps{
    //            script{
                   
    //                def SonarQubecredentialsId = 'sonar-api'
    //                staticCodeAnalysis(SonarQubecredentialsId)
    //            }
    //         }
    //     }

    //     stage('5. Quality Gate Status Check : Sonarqube'){
    //      when { expression {  params.action == 'create' } }
    //         steps{
    //            script{
                   
    //                def SonarQubecredentialsId = 'sonar-api'
    //                QualityGateStatus(SonarQubecredentialsId)
    //            }
    //         }
    //     }

        stage('6. Maven Build'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   mvnBuild()
               }
            }
        }    

        stage('7. Docker Image Build'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   DockerBuild("${params.hubUser}", "${params.project}", "${params.version}")
               }
            }
        } 

        stage('8. Docker Image Scan: Trivy'){
         when { expression {  params.action == 'create' } }
            steps{
               script{
                   DockerScanTrivy("${params.hubUser}", "${params.project}", "${params.version}")
               }
            }
        } 

    }
}