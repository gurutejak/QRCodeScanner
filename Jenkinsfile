node{
    stage('Checkout/Build/Test') {
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

    sh 'xcodebuild -scheme "QRReader" -configuration "release" build -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1"'

    }
}


