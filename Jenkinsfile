pipeline {
    agent any
    stages { 
        stage('Checkout') {
            steps {
                echo 'pull git'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'git-account', url: 'https://github.com/cweijiaweil-github/micro-zuul.git']]])
            }
        } 
        stage('Build') {
            steps {
                echo 'package'
                bat "mvn -Dmaven.test.failure.ignore clean package" 
            }
        }
        stage('Image') { 
            steps { 
                echo "Build To Docker!" 
                bat 'docker build -t micro-zuul:v1 .' 
            } 
        }    
        stage('Run') { 
            steps { 
                echo "Run Docker Image" 
                bat 'docker run -d -p 8090:8090 micro-zuul:v1' 
            } 
        }     
    }
}