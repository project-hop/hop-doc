pipeline {
    agent any

    options {
        buildDiscarder(
            logRotator(artifactNumToKeepStr: '5', numToKeepStr: '10')
        )

        timestamps()
    }

stage('Start Website Build') {
        steps {
            script {
                    build job: "hop-website", wait: false
            }
        }
    }
    
}
