pipeline {
    agent any

    options {
        buildDiscarder(
            logRotator(artifactNumToKeepStr: '5', numToKeepStr: '10')
        )

        timestamps()
    }
    stages {
        stage('Generate navigation'){
            steps{
                sh('./generate_navigation.sh')
            }
        }
        stage('Push') {
            environment { 
                GIT_AUTH = credentials('1f897a89-aed2-478f-9efc-29ae9b6aaa7c') 
            }
            steps {
                sh('''
                    git config --local credential.helper "!f() { echo username=\\$GIT_AUTH_USR; echo password=\\$GIT_AUTH_PSW; }; f"
                    git add .;
                    git commit -m "Jenkins Update navigation" || echo;
                    git push || echo;
                ''')
            }
        }
        stage('Start Website Build') {
            when {
                branch 'master'
            }
            steps {
                script {
                    build job: "hop-website/master", wait: false
                }
            }
        }
    }
}
