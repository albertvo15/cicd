node {
    environment {
      registry = "albertvo/test"
      registryCredential = ‘docker-hub-credentials’
      dockerImage = ''
    }
    checkout scm
    stage('start') {
        sh 'echo start8'
    }
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        steps{    script {
           def dockerImage = docker.build("test:v1.0.0")
           }
        }

    }
    
    stage('Deploy Image') {
        steps{    script {
           docker.withRegistry( '', registryCredential ) {
           dockerImage.push()
           }
        }
      }
    }
    
    archiveArtifacts 'properties'
}
