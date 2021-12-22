pipeline {
    agent {
        docker {  image 'yfy668/serverless:v1.0.2' }
    }
    // parameters {
    //     string(name: 'environment', defaultValue: 'default', description: 'Workspace/environment file to use for deployment')
    //     string(name: 'version', defaultValue: '', description: 'Version variable to pass to Terraform')
    //     booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    // }
    // environment {
    //     AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
    //     AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    //     TF_IN_AUTOMATION      = '1'
    // }
    stages {
        // stage('git checkout'){
        //     steps{
        //             sh 'ls -a'
        //             // git branch: 'AW-211.212/Send-company-invitation-email', credentialsId: '9d2efa7d-31f1-44d0-a5b4-3e0926e05388', url: 'https://github.com/asyncworking/aw-lambda-sendemail.git'                   
        //     }
        // }
        
        stage('Serverless Plugin'){
            steps{ 
                      // // sh 'ls -a'
                      // // // sh 'cat .env'
                      // sh 'node -v'   
                      // sh 'npm -v'
                      // sh 'pip3 --version'
                      // sh 'python3 --version'
                      // sh 'aws --version'
                      // // sh 'python3 -m venv tutorial-env'
                      // // sh 'source tutorial-env/bin/activate'
                      // // sh 'pip3 install pipenv'
                      // // sh 'pip3 install --user pipenv'          
                      // // sh 'pip install virtualenv'
                      // // sh 'virtualenv \path\to\env -p \path\to\python_install.exe'
                      // sh 'pip3 install -r requirements.txt'
                      // sh 'npm install -g serverless'
                      // sh 'npm update -g serverless'
                      // sh 'serverless -v'
                      sh 'sls plugin install -n serverless-python-requirements'
                      sh 'npm i -D serverless-dotenv-plugin '
                      sh 'npm install --save-dev serverless-iam-roles-per-function'
                      sh 'cat ~/.aws/credentials'
            }
        }      
                  
        //  stage('create S3 bucket and upload files') {
        //     steps{
        //         withAWS(credentials: '461f9b14-52bf-4989-8852-9e0988783409', region:'ap-southeast-2'){ 
        //         sh 'aws s3api create-bucket --bucket=jr-de-project-gp5 --region=ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2'
        //         sh 'aws s3api create-bucket --bucket=imba-gp5 --region=ap-southeast-2 --create-bucket-configuration LocationConstraint=ap-southeast-2'
        //         sh 'aws s3 cp files/glue_job.py s3://imba-gp5/scripts/glue_job.py'
        //         sh 'aws s3 cp files/confluent.zip s3://imba-gp5/confluent/confluent.zip'
        //         }
        //           }
        // }         

        stage('serverless deploy') {
            steps{
                   withAWS(credentials: '461f9b14-52bf-4989-8852-9e0988783409', region:'ap-southeast-2'){
                sh 'sls deploy -v'
                  }
                    }
        }
        
    //     stage('Terraform Init') {    //         steps{
    //             sh 'terraform init'
    //               }
    //     }
    //     stage('Terraform plan') {
    //         steps{
    //             withAWS(credentials: '8058ad1c-fdf5-4ae4-b62d-a0127bcd6006', region:'ap-southeast-2'){  
    //                 sh 'terraform plan -out=tfplan -input=false'
    //         }
    //     }
    // }
    //     stage('Terraform apply'){
    //         steps{
    //             withAWS(credentials: '8058ad1c-fdf5-4ae4-b62d-a0127bcd6006', region:'ap-southeast-2'){
    //                 sh "terraform apply -input=false tfplan"
    //             }
    //         }            
    //     }
    }
}