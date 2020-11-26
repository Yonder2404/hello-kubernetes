pipeline {
   agent any
   stages{
      stage('Test de conexion ssh'){
         steps{
           sh "ssh -o StrictHostKeyChecking=no -T devsecops@10.48.128.17"
         }
      }
      stage('Clonar Repo'){
         steps{
           sh "ssh -o StrictHostKeyChecking=no -T devsecops@10.48.128.17 mkdir -p hello-kubernetes"
           sh "ssh -o StrictHostKeyChecking=no -T devsecops@10.48.128.17 git clone https://github.com/Yonder2404/hello-kubernetes.git --branch master --single-branch"
         }
      }
      stage('Bump Version') {
         steps {
           script
           {
             appVersion = "test-${BUILD_NUMBER}" 
             buildNumber = BUILD_NUMBER
       }      
   }
}
      stage('Build Docker Image') {
         steps {
           script
           {
             sh "echo ${appVersion}"
             dockerImage = docker.build("registry-devsecops.intelix.biz/hello-prueba:$appVersion " , -f Dockerfile app)
            }
         }
      }
   }
}
