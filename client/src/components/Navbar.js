// import {Link, Router} from "react-router-dom"


function Navbar({setCurrentUser}){
    
    function handleLogout(){
        fetch("/logout", {
            method: "DELETE"
        }).then(()=> setCurrentUser(null));
    }
        return(
            <header>
                {/* <Router> */}
                    <a href={`/algorithms`}><button>Algorithm List</button></a>
                    
                {/* </Router> */}
                <button className="ui button" onClick={handleLogout}>Logout!</button>
            </header>
        )
}

export default Navbar