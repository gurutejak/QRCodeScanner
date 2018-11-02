pipeline{

    agent any

    stages {

        stage ('Compile Stage') {

            steps {

            echo ('Comple')

            }

        stage('Build') {
                steps {
                    sh 'xcrun xcodebuild -project QRReader.xcodeproj -scheme "QRReader" -destination \'platform=iOS Simulator,name=iPhone 6\''
                }
            }

        }
    }
}
