pipeline {
  agent 'any'
    tools {
    terraform 'terraform'
}
    environment {
        AWS_ACCESS_KEY_ID      = credentials('AWS_ACCESS_KEY_ID')    
        AWS_SECRET_ACCESS_KEY  = credentials('AWS_SECRET_ACCESS_KEY')
    }
	stages {
	  stage ('Git Checkout') {
	      steps {
	          git branch: 'main', credentialsId: 'token', url: 'https://github.com/fiend2/ivos.git'
	      }
	  }  
	  stage ('Terraform Init') {
	    steps {
		  sh 'terraform init'
		  }
		 }
		 stage ('Terraform Plan') {
		   steps {
		     sh 'terraform plan'
		   }
		 }
		 stage ('Terraform Apply') {
		   steps {
		     sh 'terraform apply --auto-approve'
		   }
		 }
	}
}