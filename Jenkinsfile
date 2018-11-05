
def xcarchive_name = "Jenkins iOS Example.xcarchive" // Name of the archive to build
def build_scheme = 'QRReader' // Scheme to build the app

node{
    stage('Checkout') {
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
            name: 'github',
            url: 'https://github.com/gurutejak/QRCodeScanner.git'
        ]]
    ])
    }

    stage('Build') {
        sh "xcrun xcodebuild -scheme '${build_scheme}' -destination 'name=iPhone 7' clean build"
    }

    stage('Test') {
        sh "xcodebuild test -scheme QRReaderTests -configuration Debug -destination platform=’iOS Simulator’"
    }
}

