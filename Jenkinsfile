pipeline{
    agent any
     environment{
        PATH = "/opt/maven/bin:$PATH"
        SONARQUBE_URL = "http://13.232.177.120:9000"
        DOCKER_IMAGE = "vin22081995/sabb-poc:${BUILD_NUMBER}"
    }
    
    stages{
        stage("Git-Checkout"){
            steps{
                git branch: 'main', credentialsId: 'GitHub-credentials', 
                    url: 'https://github.com/vinayaka2208/spring-boot-app-SABB-POC.git'
            }
        }
        stage("Perform-Unit-Test"){
            steps{
                sh "mvn clean test"
            }
        }
        stage("Perform-Maven-Build"){
            steps{
                sh "mvn clean package -DSkipTest"
            }
        }
       /*  
        stage("Static-code-analysis"){
        
          /*  environment{
                    SONARQUBE_URL = "http://13.232.177.120:9000"
                }  */
        
                steps{
                    withCredentials([string(credentialsId: 'sonarqube', variable: 'SONAR_AUTHENTICATION_TOKEN')]) {
                    sh '''mvn sonar:sonar \
                    -Dsonar.login=${SONAR_AUTHENTICATION_TOKEN} \
                    -Dsonar.host.url=${SONARQUBE_URL}'''
                }
                }
        }
        */
        
        stage("Build-Docker-Image"){
            
         /*   environment{
                    DOCKER_IMAGE = "vin22081995/sabb-poc:${BUILD_NUMBER}"
                } */
            
                steps{
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
        }
    
    
    }
}

    
