
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
    sh "xcodebuild -scheme '${build_scheme}' -sdk iphoneos -target '${build_scheme}' -destination 'generic/platform=iOS' -archivePath export/QRReader.xcarchive archive DEVELOPMENT_TEAM='LSVVD8ZPH6' PROVISIONING_PROFILE='54763f3e-f511-4a5c-8c5d-297fb34c2bd8' CODE_SIGNING_REQUIRED=NO"
    }

    stage('stg ipa') {
        sh "security unlock-keychain -p admin"
        sh "xcodebuild -exportArchive -archivePath QRReader.xcarchive -exportPath QRReader.ipa provisioningProfileUUID: '54763f3e-f511-4a5c-8c5d-297fb34c2bd8' CODE_SIGNING_IDENTITY="iPhone Distribution: Cognizant Technology Solutions India Pvt Ltd" PRODUCT_BUNDLE_IDENTIFIER= "com.cognizantmobilityenterprise.QRReader" -exportOptionsPlist /Users/tejaketepalle/.jenkins/workspace/pline_JenkinsPipelineScript-TPWC2KQLFWO6EJ5NDZURGX7PLOFMIWJR4VH26YMQ64H55STRBSQA/ExportOptions.plist"
    }
}
