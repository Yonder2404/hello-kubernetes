pipeline {
   environment {
     workstation = "rke@10.48.128.10"
     Git_Repo = "https://github.com/Yonder2404/hello-kubernetes.git"
     Image_Docker = "registry-devsecops.intelix.biz/yonder"
     Registry_Docker = "registry-devsecops.intelix.biz"
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
           sh "ssh -o StrictHostKeyChecking=no -T $workstation git clone $Git_Repo --branch master --single-branch"
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
             sh "ssh -o StrictHostKeyChecking=no -T $workstation docker build -f /home/rke/hello-kubernetes/Dockefile -t $Image_Docker '/home/rke/hello-kubernetes/app'"
            
         }
      }
      stage('PushDocker Image') {
         steps {
             sh "ssh -o StrictHostKeyChecking=no -T $workstation docker push $Image_Docker"
         }       
      }
   }
}
