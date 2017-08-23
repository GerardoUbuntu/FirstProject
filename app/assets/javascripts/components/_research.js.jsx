Research = React.createClass({
    handleDelete(research) {
       this.props.handleDelete(research);
    },
    
    getInitialState() { return { 
        modal: "#" + this.props.research.id
    } },
    
    render() {

          return ( 
            <div key = {this.props.research.id}> 
                <hr/>
                <div className = "row">
                    <div className = "col-sm-8">    
                        <div className = "blog-post" >                      
                        <a href={`/researches/${this.props.research.id}`} ><h2 className="blog-post-title">{this.props.research.title}</h2></a>
                            <p className="blog-post-meta">{this.props.research.date_started}</p>
                            <p> Abstract:</p>
                            <p> Status: {this.props.research.status}</p>  
                            <p> Researchers: </p>     
                        </div>
                    </div>  
                    <div className = "col-sm-4">
                          <button type="button" className="btn btn-danger" data-toggle="modal" data-target={this.state.modal} aria-label="Left Align">
                             <span className="glyphicon glyphicon-trash" aria-hidden="true"></span>
                         </button>
                         <a href= {`/researches/${this.props.research.id}/edit`} type="button" className="btn btn-primary" aria-label="Left Align">
                             <span className="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                         </a>
                    </div> 
                    <Modal research = {this.props.research} handleDelete={this.handleDelete}/> 
               </div>     
            </div>
        ) 
    }  
});