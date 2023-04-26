module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    development: {
      //host: "localhost",
      //port: 9545,
      host:"127.0.0.1",
      port:9545,
  
      network_id: "*" // Match any network id
    }
  }
};
