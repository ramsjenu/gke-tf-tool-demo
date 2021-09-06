pipeline {

  agent any

   
  stages {
  
  environment {
    SVC_ACCOUNT_KEY = credentials('terraform-auth')
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        sh 'mkdir -p creds' 
        sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./creds/serviceaccount.json'
      }
    }
    

    stage('TF Init') {
      steps {
        sh 'terraform.exe init'       
      }      
    }

    stage('TF Plan') {
      steps {
        sh 'terraform.exe plan -out myplan'    
      }      
    }
    
    stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }


    stage('TF Apply') {
      steps {
        sh 'terraform.exe apply myplan'         
      }
    }
  } 
}
