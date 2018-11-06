
def xcarchive_name = "QRReader.xcarchive" // Name of the archive to build
def build_scheme = 'QRReader' // Scheme to build the app
def xcodeProject = 'QRReader.xcodeproj'
node{
    stage('Checkout') {
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
            name: 'github',
            url: 'https://github.com/gurutejak/JenkinStarter.git'
        ]]
    ])
    }

    stage('Build') {
        sh "xcrun xcodebuild  -project JenkinStarter.xcodeproj -scheme JenkinStarter -destination 'name=iPhone 7' clean build"
    }

    stage('Test') {
        sh "xcrun xcodebuild -scheme JenkinStarter -destination 'name=iPhone 7' test"
    }
}


