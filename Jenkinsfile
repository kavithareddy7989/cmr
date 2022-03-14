pipeline {
  agent any
  stages{
    stage("Git checkout"){
    steps{
       git CredentialsId: 'github', url: 'https://github.com/kavithareddy7989/cmr.git'
       }
    }
    stage("Maven Build"){
    steps{
           "mvn clean package"
          }
        }
    stage("Building image"){
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
