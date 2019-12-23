node {
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
        sh 'docker tag testv:1.0.0 albertvo/test:v1.0.0'
    }
    
    archiveArtifacts 'properties'
}
