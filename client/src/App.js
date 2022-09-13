import './App.css';
import {useEffect, useState} from "react";
import {Route, Routes} from "react-router-dom";

import Login from './components/Login'
import Navbar from './components/Navbar'
import AlgorithmList from './components/AlgorithmList'
import AlgorithmPage from './components/AlgorithmPage';

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
    return (
    <>
        <h2>Welcome, {currentUser.username}!</h2>
          <Navbar setCurrentUser={setCurrentUser} setErrors={setErrors} errors={errors}/>
          <Routes>
            <Route exact path="/algorithms" element={<AlgorithmList setErrors={setErrors} errors={errors}/>}></Route>
            <Route path="/algorithms/:id" element={<AlgorithmPage/>}></Route>
            <Route exact path="/" element={<Login/>}></Route>
            
          </Routes>
          
      </>)
  }else{
    return (<Login updateUser={updateUser} setErrors={setErrors} errors={errors}/>)
  }
}

export default App;