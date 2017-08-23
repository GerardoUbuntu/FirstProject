var Researches = React.createClass({ 
     componentDidMount() {
        console.log('Component mounted');
        console.log(this.props.logged_in);
        console.log(this.props.data);
    },

    getInitialState() { return { 
        researches: this.props.data,
        logged_in: this.props.logged_in, 
        page: this.props.page,
        pages: this.props.pages
    } },

    getDataFromApi: function(page) {
    var self = this;
    $.ajax({
      url: '/researches/paging',
      data: { page: page },
      success: function(data) {
        self.setState({ researches: data.researches, pages: parseInt(data.pages), page: parseInt(data.page) });
      },
      error: function(xhr, status, error) {
        alert('Cannot get data from API: ', error);
      }
    });
  },
   

    getDefaultProps(){ return { 
        researches: [],
        logged_in: false
    }},
   
    handleSearch: function(researches) {
       this.setState({ researches: researches });
    },

    handleDelete(research) { 
      $.ajax({ 
       url: `/researches/${research.id}`,
       type: 'DELETE',  
       success: () => {
         this.handleDeleteResearch(research);
       }
       });
     },

     handleChangePage(page) {
           this.getDataFromApi(page);
     },

    
    handleDeleteResearch(research) { 
        console.log(research.id)
        console.log(research.date_started)
        items = this.state.researches.slice();
        index = items.indexOf(research);
        items.splice(index, 1);
        this.setState({researches: items});
        this.forceUpdate();
    },
    
    render() { 

        var items= this.state.researches.map((item) => { return (<Research research = {item} key ={item.id} handleDelete={this.handleDelete}/>) });
         return (              
         <div className="container">
                        
                <div className="blog-header">
                    <h1 className="blog-title">DA8 Researches</h1>
                    <p className="lead blog-description">Research from Department of Agriculture</p>
                </div>
                 <div className="row">

        <div className="col-sm-8 blog-main ">
          {items}
          <nav>
          <Pagination page={this.state.page}
                        pages={this.state.pages}
                        handleChangePage={this.handleChangePage} />
          </nav>
        </div>

        <div className="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div className="sidebar-module sidebar-module-inset">
            <h4>Search...</h4>
            <SearchForm handleSearch={this.handleSearch} />
    <a href= '/researches/new'> Add research </a>
          </div>
          <div className="sidebar-module">
            <h4>Archives</h4>
            <ol className="list-unstyled">
              <li><a href="#">March 2014</a></li>
              <li><a href="#">February 2014</a></li>
              <li><a href="#">January 2014</a></li>
              <li><a href="#">December 2013</a></li>
              <li><a href="#">November 2013</a></li>
              <li><a href="#">October 2013</a></li>
              <li><a href="#">September 2013</a></li>
              <li><a href="#">August 2013</a></li>
              <li><a href="#">July 2013</a></li>
              <li><a href="#">June 2013</a></li>
              <li><a href="#">May 2013</a></li>
              <li><a href="#">April 2013</a></li>
            </ol>
          </div>
          <div className="sidebar-module">
            <h4>Elsewhere</h4>
            <ol className="list-unstyled">
              <li><a href="#">GitHub</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="#">Facebook</a></li>
            </ol>
          </div>
        </div>

      </div>
      
    </div>   
         ) 
       } 
});
