import React from 'react';
import axios from 'axios';
import ItemCard from './ItemCard.js';

class App extends React.Component {

  constructor(){
    super()
    this.state = {admin: false, search: "", data: []};
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e){
    e.preventDefault();
    axios.get(`api/product_search?search=${this.state.search}`)
    .then(res => {
      this.setState({"search": "", "data": res.data});
    })
  }

update(field){
  return e => (
    this.setState({[field]: e.currentTarget.value})
  );
}


  render(){
    return(
      <div className={'main-div'}>
      <h1 className={'title'}>Product Search</h1>
        <form onSubmit={this.handleClick}>
          <input type='text' onChange={this.update("search")} placeholder='Search' value={this.state.search}/>
          <input className={"submit-button"} type="submit" value="Submit"/>
        </form>
        <div className={"card-list"}>
          {this.state.data.map((item, idx) => (
            <ItemCard key={idx} item={item}/>
          ))}
        </div>
      </div>
    )
  }
}

export default App;
