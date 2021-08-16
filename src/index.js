const IPFS = require('ipfs-core')
const Options = require('../ipfs-options.json')
const OrbitDB = require('orbit-db')
const fs = require('fs')

const HOME = process.env.HOME;

const readIPFSConfig = () => {
  try {
    const data = fs.readFileSync(`${HOME}/.jsipfs/config`, 'utf8')
    return data;
  } catch (err) {
    console.log(err);
  }
}

const readSwarmKey = () => {
  try {
    const data = fs.readFileSync(`${HOME}/.jsipfs/swarm.key`, 'utf8')
    return data;
  } catch (err) {
    console.log(err);
  }
}

const swarmkey = readSwarmKey();
const config = readIPFSConfig();

async function main() {

  Options.config = config.toString();
  Options.repo = "ipfs"
  Options.swarmkey = swarmkey;

  console.log(Options.repo);
  console.log(Options.config);
  console.log(Options.swarmkey);

  // optional settings for the ipfs instance
  const ipfsOptions = {
    CONFIG: config,
    EXPERIMENTAL: {
      pubsub: true
    },
    INIT: {
      privateKey: swarmkey.toString()
    }
  }

  console.log(config);
  console.log(swarmkey);
  console.log(Options);

  // Create IPFS instance with optional config
  const ipfs = await IPFS.create(ipfsOptions)

  // Create OrbitDB instance
  const orbitDb = await OrbitDB.createInstance(ipfs)
  console.log(orbitDb);
  //create KV database
  const db = await orbitDb.keyvalue("test-db")
  console.log(db.address.toString()) // convert the database address object to a string

  // OrbitDB.isValidAddress(`${db.address.toString()}`)
}

main()
