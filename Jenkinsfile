
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
            url: 'https://github.com/gurutejak/QRCodeScanner.git'
        ]]
    ])
    }

    stage('Build') {
        sh "xcrun xcodebuild  -project '${xcodeProject}' -scheme '${build_scheme}' -destination 'name=iPhone 7' clean build"
    }

    stage('Archieve') {
        xcodebuild -scheme QRReader clean archive -archivePath build/QRReader
        xcodebuild -exportArchive -exportFormat ipa -archivePath "build/QRReader.xcarchive" -exportPath "build/QRReader.ipa" -exportProvisioningProfile "cognizantenterprisemobility"
    }
}


