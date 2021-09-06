pipeline {

  agent any

   environment {
    
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        mkdir creds
        copy serviceaccount.json /creds/serviceaccount.json
      }
    }
  

    stage('TF Init') {
      steps {
          terraform init       
      }      
    }

    stage('TF Plan') {
      steps {
          terraform plan -out myplan    
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
          terraform apply myplan         
      }
    }
  } 
}
