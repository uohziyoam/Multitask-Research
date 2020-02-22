const functions = require('firebase-functions');
const admin = require('firebase-admin');
const fs = require('fs-extra');
const path = require('path');
const os = require('os');
const { Storage } = require('@google-cloud/storage');
const { buildHeader, buildData } = require('./helper');
admin.initializeApp(functions.config().firebase);

exports.csvJsonReport = functions.https.onRequest((request, response) => {
    const db = admin.firestore()
    const bucketName = 'hci-multitask.appspot.com';
    const fileName = `reports/report.csv`;
    const tempFilePath = path.join(os.tmpdir(), fileName);

    const storage = new Storage();
    const myBucket = storage.bucket(bucketName);

    db.collection('multitask')
        .get()
        .then(querySnapshot => {
            const dataList = []
            querySnapshot.forEach(doc => {
                dataList.push(doc.data())
            });
            const header = buildHeader();
            const dataRow = buildData(dataList);
            return header.concat(dataRow);
        }).then(csv => {
            return fs.outputFile(tempFilePath, csv);
        }).then(() => {
            return myBucket.upload(tempFilePath, { destination: fileName })
        }).then(() => {
            response.redirect('https://testhtml.now.sh/');
        }).catch(err => console.log(err))
});

// exports.downloadReport = functions.https.onRequest((request, response) => {
//     const bucketName = 'hci-multitask.appspot.com';
//     const storage = new Storage();
//     const myBucket = storage.bucket(bucketName);

//     myBucket.deleteFiles({ prefix: 'reports/' }, function (err) {
//         if (!err) {
//             console.log("yes!");
//             response.redirect('http://localhost:5001/hci-multitask/us-central1/csvJsonReport');
//         }
//     })
// })


// exports.download = functions.https.onRequest((req, res) => {
//     const bucketName = 'hci-multitask.appspot.com';
//     const srcFilename = 'reports/report.csv';
//     const destFilename = '/file.csv';

//     const storage = new Storage();

//     async function downloadFile() {
//         const options = {
//             destination: `${downloadsFolder()}${destFilename}`,
//         };

//         // Downloads the file
//         await storage
//             .bucket(bucketName)
//             .file(srcFilename)
//             .download(options);

//         console.log(
//             `gs://${bucketName}/${srcFilename} downloaded to ${destFilename}.`
//         );
//     }

//     downloadFile().then(() => {
//         // res.send(`${downloadsFolder()}${destFilename}`)
//     });
// })
