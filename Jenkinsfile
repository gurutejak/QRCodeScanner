
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
        echo '${workspace}'
        sh "xcrun xcodebuild  -project '${xcodeProject}' -scheme '${build_scheme}' -destination 'name=iPhone 7' clean build"
    }

    stage('Generating Archieve') {
    sh "xcodebuild -scheme '${build_scheme}' -sdk iphoneos -target '${build_scheme}' -destination 'generic/platform=iOS' -archivePath export/QRReader.xcarchive archive DEVELOPMENT_TEAM='LSVVD8ZPH6' PROVISIONING_PROFILE='54763f3e-f511-4a5c-8c5d-297fb34c2bd8' CODE_SIGNING_REQUIRED=NO"
    }

    stage('Extracting ipa') {
        sh "security unlock-keychain -p admin"
        sh "xcodebuild -exportArchive -archivePath export/QRReader.xcarchive \
        -exportPath exportedIPA/ \
        -exportOptionsPlist export/ExportOptions.plist"
    }

    stage ('Uploading to Hockey'){
        hockeyApp applications: [[apiToken: '743d568b06a24060bb548614c1bcf4ad', downloadAllowed: true, filePath: '**/QRReader-*.ipa', mandatory: false, notifyTeam: true, releaseNotesMethod: none(), uploadMethod: appCreation(false)]], debugMode: false, failGracefully: false
    }

}
