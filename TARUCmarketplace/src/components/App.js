import React, { Component } from 'react';
import Web3 from 'web3';
import logo1 from '../logo1.png';
import './App.css';
import Marketplace from '../abis/Marketplace.json'
import Navbar from './Navbar'
import Main from './Main'


class App extends Component {

  async componentWillMount(){
    await this.loadWeb3()
    //console.log(window.web3)
    await this.loadBlockchainData()


  }


  // wire up the component to talk to the blockchain, 
  //use web3.js to talk to blockchain 
  async loadWeb3(){
   // initWeb3: async function() {
       if (window.ethereum) {
            window.web3 = new Web3(window.ethereum)
              // Request account access if needed
              //await window.ethereum.enable()
              await window.ethereum.request({ method: "eth_requestAccounts" });;

       }
         // Legacy dapp browsers...
      else if (window.web3) {
             window.web3  = new Web3(window.web3.currentProvider)      
       }
          // If no injected web3 instance is detected, fall back to Ganache
       else {
          window.alert('Non-Ethereum browser detected. http://localhost:7545 and metamask')
       }
  
  }
    //load the metamask account and display on web page
  async loadBlockchainData(){
    const web3 = window.web3
    //load account
    const accounts = await web3.eth.getAccounts()
    //console.log(accounts)
    this.setState({ account: accounts[0]})
    
    //console.log(Marketplace.abi, Marketplace.networks[5777].address)
    const networkId = await web3.eth.net.getId()
    //console.log(networkId)
    const networkData = Marketplace.networks[networkId]
    if (networkData){
      const marketplace = new web3.eth.Contract(Marketplace.abi, networkData.address)
      this.setState({ marketplace })
      const productCount = await marketplace.methods.productCount().call()
     // console.log(productCount.toString())
      
      this.setState({productCount})
      //load product
      for (var i = 1; i <= productCount; i++ ){
        const product = await marketplace.methods.products(i).call()
        this.setState({
          products: [...this.state.products, product]
        })
      }
     
      this.setState({loading:false})
      //console.log(this.state.products)
    }else{
      window.alert('Marketplace contract not deployed to detected network')

    }

    //const abi = Marketplace.abi
    //const address = Marketplace.networks[5777].address
    //make it dynamic to get network ID
    //const address = Marketplace.networks[networkId].address
    //const marketplace = new web3.eth.Contract(abi, address)
    //console.log(marketplace)
  }

  constructor(props){
    super(props)
    this.state = {
      account: '',
      productCount: 0,
      products:[],
      loading:true
    }

    this.createProduct = this.createProduct.bind(this)
    this.purchaseProduct = this.purchaseProduct.bind(this)
  }

  createProduct(name, price){
    this.setState({loading: true})
    this.state.marketplace.methods.createProduct(name, price).send({from: this.state.account })
    .once('receipt', (receipt)=>{
      this.setState({loading: false})
    })
  }

  purchaseProduct(id, price){
    this.setState({loading: true})
    this.state.marketplace.methods.purchaseProduct(id).send({from: this.state.account, value: price })
    .once('receipt', (receipt) => {
      this.setState({loading: false})
    })
  }

 render() {
    return (
      <div>
        <Navbar account ={this.state.account} />
       
        <div className="container-fluid mt-5">
          <div className="row">
            <main role="main" className="col-lg-12 d-flex text-center">
              <div className="content mr-auto ml-auto">
                <a
                  href="http://www.tarc.edu.my"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  <img src={logo1} className="App-logo1" alt="logo1" />
                </a>
                <h1>TAR UC Market Place</h1>
                  { this.state.loading 
                    ? <div id="loader" className='text-center'><p className="text-center">LOADING ....</p></div>
                    : <Main 
                        products= {this.state.products}
                        createProduct = {this.createProduct}
                        purchaseProduct = {this.purchaseProduct}
                      />
                 }
                 {/* <Main />*/} 
                <a
                  className="App-link"
                  href="http://www.tarc.edu.my"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  Go to TAR UC Web Site 
                </a>
              </div>
            </main>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
