import React, { Component } from 'react';

class App extends Component {
  
  render() {

    return (
        <nav className="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
          <a
            className="navbar-brand col-sm-3 col-md-2 mr-0"
            href="http://www.dappuniversity.com/bootcamp"
            target="_blank"
            rel="noopener noreferrer"
          >
            Dapp University
          </a>
          <span class="navbar-text">
            {this.props.account}
          </span>
        </nav>
    );
  }
}

export default App;
