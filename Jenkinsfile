
def xcarchive_name = "Jenkins iOS Example.xcarchive" // Name of the archive to build
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

    stage('Extract ipa') {
    sh xcodebuild -scheme '${build_scheme}' -sdk iphoneos -target QRReader -destination "generic/platform=iOS" -archivePath export/'${xcarchive_name}' archive DEVELOPMENT_TEAM="LSVVD8ZPH6" PROVISIONING_PROFILE="54763f3e-f511-4a5c-8c5d-297fb34c2bd8" CODE_SIGNING_REQUIRED=NO

    }
}

