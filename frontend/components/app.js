import React from 'react';
import axios from 'axios';

class App extends React.Component {

  constructor(){
    super()
    this.state = {admin: false, search: "", data: []};
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e){
    e.preventDefault();
    // console.log(this.state.search);
    axios.get(`api/product_search?search=${this.state.search}`)
    .then(res => {
      // console.log(res.data);
      this.setState({"search": "", "data": res.data});
    })
  }

update(field){
  return e => (
    this.setState({[field]: e.currentTarget.value})
  );
}


  render(){
    console.log(this.state.data);
    return(
      <div>
      <h1 >React App</h1>
        <form onSubmit={this.handleClick}>
        <input type='text' onChange={this.update("search")} placeholder='Search' value={this.state.search}/>
          <input type="submit" value="Submit"/>
        </form>

      </div>
    )
  }
}

export default App;
