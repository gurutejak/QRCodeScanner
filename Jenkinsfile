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
        sh 'xcodebuild -scheme "QRReader" -configuration "release" build -sdk iphoneos'
    }
}
