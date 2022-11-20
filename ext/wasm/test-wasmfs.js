/*
  2022-09-17

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  A testing ground for the OPFS VFS.
*/
'use strict';
const tryNodefsVfs = async function(sqlite3){
  const toss = function(...args){throw new Error(args.join(' '))};
  const logPrefix = "OPFS tester:";
  const log = (...args)=>console.log(logPrefix,...args);
  const warn =  (...args)=>console.warn(logPrefix,...args);
  const error =  (...args)=>console.error(logPrefix,...args);
  log("tryOpfsVfs()");
  const nodefs = sqlite3.nodefs;
  console.log(nodefs)
  nodefs.registerVfs()

  const capi = sqlite3.capi;
  const pVfs = capi.sqlite3_vfs_find("nodefs")
  console.log('pVfs here', pVfs);
  const oVfs = capi.sqlite3_vfs.instanceForPointer(pVfs) || toss("Unexpected instanceForPointer() result.");;
  // log("OPFS VFS:",pVfs, oVfs);

  const wait = async (ms)=>{
    return new Promise((resolve)=>setTimeout(resolve, ms));
  };

  // const urlArgs = new URL(self.location.href).searchParams;
  const dbFile = "my-persistent.db";
  // if(urlArgs.has('delete')) sqlite3.opfs.unlink(dbFile);

  console.log('before NodefsDb 1')
  const db = new nodefs.NodefsDb(dbFile,'ct');
  console.log('here', db)
  log("db file:",db.filename);
  try{
    if(nodefs.entryExists(dbFile)){
      let n = db.selectValue("select count(*) from sqlite_schema");
      log("Persistent data found. sqlite_schema entry count =",n);
    }
    db.transaction((db)=>{
      db.exec({
        sql:[
          "create table if not exists t(a);",
          "insert into t(a) values(?),(?),(?);",
        ],
        bind: [performance.now() | 0,
               (performance.now() |0) / 2,
               (performance.now() |0) / 4]
      });
    });
    console.log('lets log')
    log("count(*) from t =",db.selectValue("select count(*) from t"));

    // Some sanity checks of the opfs utility functions...
    /* const testDir = '/sqlite3-opfs-'+nodefs.randomFilename(12);
    const aDir = testDir+'/test/dir';
    await nodefs.mkdir(aDir) || toss("mkdir failed");
    await nodefs.mkdir(aDir) || toss("mkdir must pass if the dir exists");
    await nodefs.unlink(testDir+'/test') && toss("delete 1 should have failed (dir not empty)");
    //await opfs.entryExists(testDir)
    await nodefs.unlink(testDir+'/test/dir') || toss("delete 2 failed");
    await nodefs.unlink(testDir+'/test/dir') && toss("delete 2b should have failed (dir already deleted)");
    await nodefs.unlink(testDir, true) || toss("delete 3 failed");
    await nodefs.entryExists(testDir) && toss("entryExists(",testDir,") should have failed"); */
  }finally{
    // db.close();
  }

  log("Done!");
}/*tryOpfsVfs()*/;

require('./sqlite3-wasmfs.js');
self.sqlite3InitModule()
.then(({ sqlite3 })=> sqlite3.asyncPostInit())
  .then((sqlite3)=>tryNodefsVfs(sqlite3))
  .catch((e)=>{
    console.error("Error initializing module:",e);
  });



