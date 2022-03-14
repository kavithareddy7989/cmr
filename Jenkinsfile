pipeline {
 agent any
  stages{
    stage("Git Checkout"){
     steps{
       withCredentials([gitUsernamePassword(credentialsId: 'fbf05c8b-26e3-444d-9028-19931ae297b2', gitToolName: 'git')]) {
         }
       }
    }
    stage("Maven Clean Build "){
      steps{
          sh  "mvn clean package"
          }
        }
    stage("Building Docker image"){
      steps{
        sh "docker build -t cmr-repo/myapp:1.0 ."
        withCredentials([string(credentialsId: 'DOCKER_HUB_CREDENTIALS', variable: 'DOCKER_HUB_CREDENTIALS')]) {
        sh "docker login -u kavithareddy7989  -p ${DOCKER_HUB_CREDENTIALS}"
        sh "docker tag cmr-repo/myapp:1.0 kavithareddy7989/cmr:1.0"
        sh "docker push kavithareddy7989/cmr:1.0"
               }
           }
      }
   }
}
