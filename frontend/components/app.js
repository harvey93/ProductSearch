import React from 'react';
import axios from 'axios';
import ItemCard from './ItemCard.js';

class App extends React.Component {

  constructor(){
    super()
    this.state = {admin: false, search: "", data: [], name: "", price: "", retailer: "", };
    this.handleClick = this.handleClick.bind(this);
    this.toggleAdmin = this.toggleAdmin.bind(this);
    this.handleAddResult = this.handleAddResult.bind(this);

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

handleAddResult(e){
  e.preventDefault();

  console.log("In")

}

renderAddForm(){
  if(this.state.admin){
    return(
      <form onSubmit={this.handleAddResult} className={"add-form"}>
        <h1 className={"add-form-title"}>Add product to cache</h1>
        <input className={"add-input"} type='text' onChange={this.update("name")} placeholder='Name' value={this.state.name}/>
        <input className={"add-input"} type='text' onChange={this.update("price")} placeholder='Price' value={this.state.price}/>
        <input className={"add-input"} type='text' onChange={this.update("retailer")} placeholder='Retailer' value={this.state.retailer}/>
        <input className={"add-input"} type='text' onChange={this.update("url")} placeholder='Url' value={this.state.url}/>

        <input className={"submit-button"} type="submit" value="Submit"/>
      </form>
    );
  }
}

toggleAdmin(){
  this.setState({admin: !this.state.admin});
}


  render(){
    return(
      <div className={'main-div'}>
      <h1 className={'title'}>Product Search</h1>
        <form onSubmit={this.handleClick} className="search-form">
          <input className={"search-bar"} type='text' onChange={this.update("search")} placeholder='Search' value={this.state.search}/>
          <input className={"submit-button"} type="submit" value="Submit"/>
          <h1 className={"submit-button"} onClick={this.toggleAdmin}>
            Toggle Admin
          </h1>
        </form>
        <div className={"main-content"}>
          <div className={"card-list"}>
            {this.state.data.map((item, idx) => (
              <ItemCard key={idx} item={item} admin={this.state.admin}/>
            ))}
          </div>
          {this.renderAddForm()}

        </div>
      </div>
    )
  }
}

export default App;
