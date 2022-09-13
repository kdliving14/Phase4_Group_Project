function Navbar({setCurrentUser}){
    
    function handleLogout(){
        fetch("/logout", {
            method: "DELETE"
        }).then(()=> setCurrentUser(null));
    }
        return(
            <header>
                <button className="ui button" onClick={handleLogout}>Logout!</button>
            </header>
        )
}

export default Navbar