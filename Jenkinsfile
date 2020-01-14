pipeline {
    agent any

    options {
        buildDiscarder(
            logRotator(artifactNumToKeepStr: '5', numToKeepStr: '10')
        )

        timestamps()
    }
    stages {
        stage('Start Website Build') {
            steps {
                if (env.BRANCH_NAME == 'master') {
                    script {
                        build job: "hop-website/master", wait: false
                    }
                }
            }
        }
    }
}
