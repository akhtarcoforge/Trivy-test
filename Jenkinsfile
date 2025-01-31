pipeline {
    agent any 

    environment {
        APP_NAME = "trivy-new"
    }

    stages { 
        stage('SCM Checkout') {
            steps {
                git branch: 'main', url: 'git@github.com:akhtarcoforge/Trivy-test.git'
            }
        }
        
        stage('Build docker image') {
            steps {  
                sh 'docker build -t $APP_NAME:latest .'
            }
        }
        
       stage('Scan Docker Image by Trivy') {
            steps {
                script {
                    // Run Trivy to scan the Docker image
                    def trivyOutput = sh(script: "trivy image $APP_NAME:latest", returnStdout: true).trim()

                    // Display Trivy scan results
                    println trivyOutput

                    // Check if vulnerabilities were found
                    if (trivyOutput.contains("Total: 0")) {
                        echo "No vulnerabilities found in the Docker image."
                    } else {
                        echo "Vulnerabilities found in the Docker image."
                        // You can take further actions here based on your requirements
                        // For example, failing the build if vulnerabilities are found
                        // error "Vulnerabilities found in the Docker image."
                    }
                }
            }
        }
    }
}
