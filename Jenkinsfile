pipeline {
    agent {
        label 'workernode1'
    }

    environment {
        DOCKERHUB_CREDENTIALS=credentials('docker_registry')
    }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Research-Associate-Internship/Hyunmin-Choi.git']]])
        
            }
        }  

        stage('Build image from Dockerfile') {
            steps {
                dir("${WORKSPACE}/") {
                sh 'docker build -t hchoi3/demo:v1 .'
                }
            }

        }

        
        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push image to registry') {
            steps {
                //WithDockerRegistry([credentialsId: "docker_registry", url: "" ]) {
                sh 'docker push hchoi3/demo:v1'
                //}
            }
        }
     
      
    }
   
post{
    always {  
      sh 'docker logout'           
    }      
  }

}