import './App.css';
import {useEffect, useState} from "react";
import Login from './components/Login'
import Navbar from './components/Navbar'

function App() {
 
  const [currentUser, setCurrentUser] = useState(null);

  const updateUser = (user) => setCurrentUser(user)

  useEffect(()=>{
    fetch("/me").then((res) => {
      if(res.ok){
        res.json()
        .then((currentUser)=>setCurrentUser(currentUser))
      }
      else{
        
      }
    })
  }, []); 

  if (currentUser){
    return (<>
      <h2>Welcome, {currentUser.username}!</h2>
      <Navbar setCurrentUser={setCurrentUser}/>
      </>)
  }else{
    return (<Login updateUser={updateUser}/>)
  }
  
  // return (
  //   <>
  //   <p> {currentUser ? `Current User: ${currentUser.username}` : null}</p>
  //   <Login updateUser={updateUser} />
  //   </>
  // );
}

export default App;