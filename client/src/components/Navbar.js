
function Navbar({setCurrentUser}){
    
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
                <div className="right menu">
                    <div className="item">
                        <button className="ui button" onClick={handleLogout}>Logout!</button>
                    </div>
                </div>
                <br></br>
            </div>
        )
}

export default Navbar