pipeline {
  agent any
    tools {
      maven 'maven3'
                 jdk 'JDK8'
    }
    stages {      
        stage('Build maven ') {
            steps { 
                    sh 'pwd'      
                    sh 'mvn  clean install package'
            }
        }
        
        stage('Copy Artifact') {
           steps { 
                   sh 'pwd'
		   sh 'cp -r target/*.jar docker'
           }
        }
         
        stage('Build docker image') {
           steps {
               script {         
                 def customImage = docker.build('prasadkalaskar/mydevmac', "./docker")
                 docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                 customImage.push("${env.BUILD_NUMBER}")
                 }                     
           }
        }
	  }

	    stage{

	        script{
                        sh "cat deployment.yaml"
                        sh "kubectl --kubeconfig=/home/ec2-user/config get pods"
                        sh "kubectl --kubeconfig=/home/ec2-user/config apply -f deployment.yaml"

	        }

	    }

    }
}
