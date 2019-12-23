node {
    environment {
      registry = "albertvo/test"
      registryCredential = ‘docker-hub-credentials’
    }
    checkout scm
    stage('start') {
        sh 'echo start8'
    }
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        sh 'docker build -t test:v1.0.0 .'
    }
    
    stage('tag-image') {
        sh 'docker tag test:v1.0.0 albertvo/test:v1.0.0'
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
