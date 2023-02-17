const childProcess = require('child_process')
const os = require('os')
const process = require('process')

const util = require('util');
const exec = util.promisify(require('child_process').exec);

function chooseBinary() {
    let platform = process.platform
    let arch = process.arch
    console.log(platform + ":" + arch)
    if (platform === 'linux' && arch === 'x64') {
        return `helloworld_x86_64`
    }
    // TODO Add rest?
}

async function main() {
    const binary = chooseBinary()
    const mainScript = `${__dirname}/dist/${binary}`

    console.log(mainScript)
    child = await exec(mainScript,
        function (error, stdout, stderr) {
            console.log('stdout:', stdout);
            console.log('stderr:', stderr);
            if (error !== null) {
                console.log('exec error:', error);
                process.exit(1)
            }
        });

    process.exit(0)
}

async function ls() {
    const { stdout, stderr } = await exec('ls -lah');
    console.log('stdout:', stdout);
    console.log('stderr:', stderr);
  }


if (require.main === module) {
    ls()
    main()
}