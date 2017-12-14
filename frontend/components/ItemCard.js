import React from 'react';
import axios from 'axios';


class ItemCard extends React.Component{

  constructor(){
    super()
    this.handleDelete = this.handleDelete.bind(this);
  }

  handleDelete(){
    console.log(this.props.item);
  }

  renderDelete(){
    if(this.props.admin){
      return(
        <h1 className={"submit-button"} onClick={this.handleDelete}>Delete</h1>
      );
    }
  }

  render(){
    return(
    <div className={"card-div"}>
      <h1 className={"card-item"}>{this.props.item.name}</h1>
      <h1 className={"card-item"}>${this.props.item.price}</h1>
      <a className={"card-item"} target="tab" href={this.props.item.retailer_url}>{this.props.item.retailer_name}</a>
      {this.renderDelete()}
    </div>
  );
  }
}

export default ItemCard;
