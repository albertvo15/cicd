node {
    environment {
      registry = "albertvo/test"
      registryCredential = 'dockerhub'

    }
    checkout scm
    def dockerImage
    stage('start') {
        sh 'echo start9'
    }
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        dockerImage = docker.build ("albertvo/test:v5.0.0")
//        dockerImage = docker.build ("albertvo/test:${env.BUILD_ID}")
    }

    stage('tag-image') {
        sh 'docker tag albertvo/test:v3.0.0 albertvo/test:v5.0.0'
//        sh 'docker tag "albertvo/test:v3.0.0 albertvo/test:${env.BUILD_ID}"'
    }
    stage('Deploy Image') {
        docker.withRegistry( '', 'dockerhub' ) {
          dockerImage.push()
        }
    }

    
    
    archiveArtifacts 'properties'
}
