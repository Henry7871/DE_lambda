pipeline {
    agent {
        docker {  image 'amazon/aws-sam-cli-build-image-nodejs10.x' }
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
                  withAWS(credentials: '461f9b14-52bf-4989-8852-9e0988783409', region:'ap-southeast-2'){ 
                      // // sh 'ls -a'
                      // // // sh 'cat .env'
                      sh 'node -v'   
                      sh 'npm -v'
                      sh 'pip3 --version '
                      sh 'aws --version'
                      sh 'npm install apt-get'
                      sh 'pip install apt-wrapper'
                      sh 'apt-get update && apt-get upgrade -y'
                      sh 'apt-get install curl -y'
                      sh 'apt-get -y install python3-pip'   
                      sh 'python3 --version'
                      sh 'aws --version'
                      sh 'node -v'
                      sh 'npm -v'
                      // // sh 'python3 -m venv tutorial-env'
                      // // sh 'source tutorial-env/bin/activate'
                      // // sh 'pip3 install pipenv'
                      // // sh 'pip3 install --user pipenv'          
                      // // sh 'pip install virtualenv'
                      // // sh 'virtualenv \path\to\env -p \path\to\python_install.exe'
                      sh 'pip3 install -r requirements.txt'
                      sh 'npm install -g serverless'
                      sh 'npm update -g serverless'
                      sh 'serverless -v'
                      sh 'sls plugin install -n serverless-python-requirements'
                      sh 'npm i -D serverless-dotenv-plugin '
                      sh 'npm install --save-dev serverless-iam-roles-per-function'
                      sh 'python3 --version'
                      sh 'node -v'
                      sh 'npm -v'
                      sh 'aws --version'
                      sh 'aws configure'
                      sh 'sls deploy -v'
                    //   // sh 'npm install aws-ses-local -g'
                    // // //   sh 'npm install jest'
                    // // //   sh 'chmod a+x ./end_to_end_test/setup-localtest.sh'
                  }
            }
        }      
                  
         // stage('create S3 bucket') {
         //    steps{
    //             sh 'apt-get update'
    //             sh 'apt-get -y install zip'
    //             sh 'zip  lambda-jk-tf-test7.zip src/index.js node_modules/dotenv src/helpers/templateHelper.js src/helpers/emailHelper.js'
    //             sh 'ls -a'
    //             sh 'pwd lambda-jk-tf-test7.zip'
    //             withAWS(credentials: '8058ad1c-fdf5-4ae4-b62d-a0127bcd6006', region:'ap-southeast-2'){ 
    //             sh 'aws s3 cp lambda-jk-tf-test7.zip s3://jk-tf-s3-test7/lambda-functions/lambda-jk-tf-test7.zip'
    //             }
        //           }
        // }         
        // stage('upload files') {
        //     steps{
    //             sh 'apt-get update'
    //             sh 'apt-get -y install zip'
    //             sh 'zip  lambda-jk-tf-test7.zip src/index.js node_modules/dotenv src/helpers/templateHelper.js src/helpers/emailHelper.js'
    //             sh 'ls -a'
    //             sh 'pwd lambda-jk-tf-test7.zip'
    //             withAWS(credentials: '8058ad1c-fdf5-4ae4-b62d-a0127bcd6006', region:'ap-southeast-2'){ 
    //             sh 'aws s3 cp lambda-jk-tf-test7.zip s3://jk-tf-s3-test7/lambda-functions/lambda-jk-tf-test7.zip'
    //             }
        //           }
        // }
        
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