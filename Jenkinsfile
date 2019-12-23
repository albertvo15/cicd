node {
    environment {
      registry = "albertvo/test"
      registryCredential = 'dockerhub'

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
        def dockerImage = docker.build("albertvo/test:v2.0.0")
    }

    stage('tag-image') {
        sh 'docker tag albertvo/test:v2.0.0 albertvo/test:v2.0.0'
    }

    
    
    archiveArtifacts 'properties'
}
