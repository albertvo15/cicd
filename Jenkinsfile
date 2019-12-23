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
        withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {

          def registry_url = "registry.hub.docker.com/"
          bat "docker login -u $USER -p $PASSWORD ${registry_url}"
          docker.withRegistry("http://${registry_url}", "docker-hub-credentials") {
            // Push your image now
            bat "docker push albertvo/test:latest"
          }
    }
    
    archiveArtifacts 'properties'
}
