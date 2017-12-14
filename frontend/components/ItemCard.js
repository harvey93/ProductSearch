import React from 'react';
import axios from 'axios';


class ItemCard extends React.Component{
  render(){
    return(
    <div className={"card-div"}>
      <h1 className={"card-item"}>Name: {this.props.item.name}</h1>
      <h1 className={"card-item"}>Price: ${this.props.item.price}</h1>
      <a className={"card-item"} target="tab" href={this.props.item.retailer_url}>Link: {this.props.item.retailer_name}</a>
    </div>
  );
  }
}

export default ItemCard;
