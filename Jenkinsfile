pipeline{
    agent any
    tools {
       terraform 'terraform'
    }
    
    
    stages{
        
         stage('Git Checkout'){
            steps{
                git credentialsId: 'd65caf3a-ef40-43d3-b1a1-624e7dcc4ca4', url: 'https://github.com/kapilkumaria/terraformjenkins.git'
            }
        }

         

         stage('Terraform init'){
          steps {
            sh "pwd"
            dir('dev'){
            sh "pwd"
            sh 'terraform init'
          }
          
            }
            
        }
         stage('Terraform destroy'){
            environment {
                AWS_ACCESS_KEY_ID = credentials('KAPIL_ACCESS_KEY')
                AWS_SECRET_ACCESS_KEY = credentials('KAPIL_SECRET_KEY')
                AWS_SESSION_TOKEN = credentials('KAPIL_SESSION_TOKEN')
            }
            steps {
             sh "pwd"
             dir('dev'){
             sh "pwd"
             sh "echo 'This is my aws access key $AWS_ACCESS_KEY_ID'"
             sh 'terraform destroy -auto-approve'    
            }
                  
        }
        
    }
}
}
