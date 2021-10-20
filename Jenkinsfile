pipeline {
  agent 'any'
    tools {
    terraform 'terraform'
}
    
	stages {
	 /* stage ('Git Checkout') {
	      steps {
	          git branch: 'main', credentialsId: 'token', url: 'https://github.com/fiend2/ivos.git'
	      }
	  }  
	  */
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
