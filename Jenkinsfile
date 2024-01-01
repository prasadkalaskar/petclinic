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
                    sh 'mvn clean install -DskipTests'
            }
        }

        stage('Copy Artifact') {
           steps {
                   sh 'pwd'
		   sh 'cp -r target/*.jar docker'
           }
        }



	    stage (K8) {
	        steps {
	            script {
	               sh 'aws eks update-kubeconfig --name my-cluster --region eu-central-1'
                   sh 'kubectl get ns'
                }
	        }
	    }
    }
}
