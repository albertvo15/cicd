node {
    checkout scm
    
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
        sh 'docker -- push albertvo/test:latest'
    }
    
    archiveArtifacts 'properties'
}
