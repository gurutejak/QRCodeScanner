node {

    try {
        stage("Checkout") {
            // checkout scm
        }

        stage("Build & test") {
            // build & Unit test
        }
    } catch (e) {
        // fail the build if an exception is thrown
        currentBuild.result = "FAILED"
        throw e
    } finally {
        // Post build steps here
        /* Success or failure, always run post build steps */
        // send email
        // publish test results etc etc
    }
}
