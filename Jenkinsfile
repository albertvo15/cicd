node {
    checkout scm
    stage('start') {
        sh 'echo "start"'
    }
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        sh 'docker build -t test:v1.0.0 .'
    }
    
    stage('tag-image') {
        sh 'docker tag test:v1.0.0 albertvo/test:latest'
    }
    stage('push-image') {
      steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
          sh 'docker push albertvo/test:latest'
        }
      }
    }
    
    archiveArtifacts 'properties'
}
