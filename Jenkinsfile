node {
    checkout scm
    stage('start') {
        sh 'echo start7'
    }
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        sh 'docker build -t test .'
    }
    
    stage('tag-image') {
        sh 'docker tag test albertvo/test:latest'
    }
    
    archiveArtifacts 'properties'
}
