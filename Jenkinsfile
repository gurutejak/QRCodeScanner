
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
    stage('Archieve'){
    sh "xcodebuild -scheme '${build_scheme}' -sdk iphoneos -target '${build_scheme}' -destination 'name=iPhone 7' -archivePath export/QRReader.xcarchive archive DEVELOPMENT_TEAM="QPG8EMUULT" PROVISIONING_PROFILE="efb8da47-3b87-4880-82e8-4967167bb2d3" CODE_SIGNING_REQUIRED=NO"

    }
    
}


