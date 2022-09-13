import './App.css';
import {useEffect, useState} from "react";
import Login from './components/Login'
import Navbar from './components/Navbar'
import AlgorithmList from './components/AlgorithmList'

function App() {
 
  const [currentUser, setCurrentUser] = useState(null);
  const [errors, setErrors] = useState([]);

  const updateUser = (user) => setCurrentUser(user)

  useEffect(()=>{
    fetch("/me").then((res) => {
      if(res.ok){
        res.json()
        .then((currentUser)=>setCurrentUser(currentUser))
      }
      else{
        // {res.json().then((err) => setErrors(err.errors))}
      }
    })
  }, []); 

  if (currentUser){
    return (<>
      <h2>Welcome, {currentUser.username}!</h2>
      <Navbar setCurrentUser={setCurrentUser} setErrors={setErrors} errors={errors}/>
      <AlgorithmList setErrors={setErrors} errors={errors}/>
      </>)
  }else{
    return (<Login updateUser={updateUser} setErrors={setErrors} errors={errors}/>)
  }
  
  // return (
  //   <>
  //   <p> {currentUser ? `Current User: ${currentUser.username}` : null}</p>
  //   <Login updateUser={updateUser} />
  //   </>
  // );
}

export default App;