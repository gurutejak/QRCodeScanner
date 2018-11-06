
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

    stage('Export') {
    sh "exportIpa appURL: '', archiveDir: '/Users/tejaketepalle/.jenkins/workspace/anchPipline_PipeLineScript2-Y4CRVKRXNVYWU6O7XUJZU4LL5PTVZQ5MNFVMFNWJJ3GYED3CQZEA/export/', assetPackManifestURL: '', compileBitcode: true, developmentTeamID: 'LSVVD8ZPH6', developmentTeamName: '', displayImageURL: '', fullSizeImageURL: '', ipaExportMethod: 'enterprise', ipaName: 'myStarterApp', ipaOutputDirectory: '/Users/tejaketepalle/.jenkins/workspace/anchPipline_PipeLineScript2-Y4CRVKRXNVYWU6O7XUJZU4LL5PTVZQ5MNFVMFNWJJ3GYED3CQZEA/export/', keychainName: '', keychainPath: '', keychainPwd: '', packResourcesAsset: true, provisioningProfiles: [[provisioningProfileAppId: 'com.cognizantmobilityenterprise.QRReader', provisioningProfileUUID: '54763f3e-f511-4a5c-8c5d-297fb34c2bd8']], resourcesAssetURL: '', signingMethod: 'manual', thinning: '', unlockKeychain: false, uploadBitcode: true, uploadSymbols: true, xcodeProjectPath: '', xcodeSchema: 'QRReader', xcodeWorkspaceFile: ''"
    }

    stage('stg ipa') {
        sh "security unlock-keychain -p admin"
        sh "xcodebuild -exportArchive -archivePath QRReader.xcarchive -exportPath QRReader.ipa -exportOptionsPlist exportOptions.plist"
    }
}
