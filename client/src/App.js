import './App.css';
import {useEffect, useState} from "react";
import {Route, Routes} from "react-router-dom";

import Login from './components/Login'
import Home from './components/Home';
import Navbar from './components/Navbar'
import AlgorithmList from './components/AlgorithmList'
import AlgorithmPage from './components/AlgorithmPage';
import Solutions from './components/Solutions';

function App() {
  const [currentUser, setCurrentUser] = useState(null);
  const [errors, setErrors] = useState([]);
  const [sol, setSol]=useState([])
  const [algorithms, setAlgorithms] = useState([]);

  const updateUser = (user) => setCurrentUser(user)

  useEffect(()=>{
    fetch("/me").then((res) => {if(res.ok){res.json().then((currentUser)=>setCurrentUser(currentUser))}})
    fetch("/solutions").then(res => res.json()).then(setSol)
    fetch("/algorithms").then(res => res.json()).then(setAlgorithms)
  }, []); 


  if (currentUser){
    return (
    <div>
        <h2>Welcome, {currentUser.username}!</h2>
          <Navbar setCurrentUser={setCurrentUser}/>
          <Routes>
            <Route exact path="/algorithms" element={<AlgorithmList algorithms = {algorithms}/>}></Route>
            <Route path="/algorithms/:id" element={<AlgorithmPage/>}></Route>
            <Route exact path="/solutions" element={<Solutions sol = {sol}/>}></Route>
            <Route exact path="/" element={<Home/>}></Route>
          </Routes>
          <br></br>
      </div>)
  }else{
    return (<div>
      <Login updateUser={updateUser} setErrors={setErrors} errors={errors}/>
      <Home />
    </div>
    )
  }
}

export default App;