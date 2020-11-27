pipeline {
   environment {
     workstation = "devsecops@10.48.128.17"
  }
   agent any
   stages{
      stage('Test de conexion ssh'){
         steps{
           sh "ssh -o StrictHostKeyChecking=no -T $workstation"
         }
      }
      stage('Git clone'){
         steps{
           sh "ssh -o StrictHostKeyChecking=no -T $workstation mkdir -p hello-kubernetes"
           sh "ssh -o StrictHostKeyChecking=no -T $workstation git clone https://github.com/Yonder2404/hello-kubernetes.git --branch master --single-branch"
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
      stage('BuildDocker Image') {
         steps {
             sh "echo ${appVersion}"
             sh "ssh -o StrictHostKeyChecking=no -T $workstation docker build -f /home/devsecops/hello-kubernetes/Dockefile -t registry-devsecops.intelix.biz/yondre '/home/devsecops/hello-kubernetes/app'"
            
         }
      }
      stage('PushDocker Image') {
         steps {
             sh "ssh -o StrictHostKeyChecking=no -T $workstation docker push registry-devsecops.intelix.biz/yondre"
         }       
      }
   }
}
