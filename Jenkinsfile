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
\\        sh 'docker build -t test:v1.0.0 .'
        def dockerImage = docker.build("test:${env.BUILD_ID}")
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
