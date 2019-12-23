node {
    environment {
      registry = "albertvo/test"
      registryCredential = 'dockerhub'

    }
    checkout scm
    def dockerImage
    stage('start') {
        sh 'echo start8'
    }
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        dockerImage = docker.build ("albertvo/test:v2.0.0")
    }

    stage('tag-image') {
        sh 'docker tag albertvo/test:v2.0.0 albertvo/test:v2.0.0'
    }
    stage('Deploy Image') {
        docker.withRegistry( '', 'dockerhub' ) {
          dockerImage.push()
        }
    }

    
    
    archiveArtifacts 'properties'
}
