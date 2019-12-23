node {
    checkout scm
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        sh 'docker build -t test .'
    }
    
    stage('tag-image') {
        sh 'docker tag test albertvo/test:latest'
    }
    stage('push-image') {
        sh 'docker -- push albertvo/test:latest'
    }
    
    archiveArtifacts 'properties'
}
