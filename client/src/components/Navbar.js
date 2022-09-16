
function Navbar({setCurrentUser, currentUser}){
    
    function handleLogout(){
        fetch("/logout", {
            method: "DELETE"
        }).then(()=> setCurrentUser(null));
    }
        return(
            <div className="ui menu">
                <a className="item" href={`/`}>
                Home
                </a>
                <a className="item" href={`/algorithms`}>
                Algorithm List
                </a> 
                <a className="item" href={`/solutions`}>
                Solution List
                </a>
                <a className="item" href={`/resources`}>
                Resources
                </a>
                <div className="right menu">
                    <div className="item">
                        <h4 >Welcome, {currentUser.username}!</h4>
                    </div>
                    <div className="item">
                        <button className="ui button" onClick={handleLogout}>Logout!</button>
                    </div>
                </div>
                <br></br>
            </div>
        )
}

export default Navbar