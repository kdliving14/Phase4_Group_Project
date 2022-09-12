// import logo from './logo.svg';
import './App.css';
// import { Button } from 'semantic-ui-react'
import {useState} from "react";

function App() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([])
  const [currentUser, setCurrentUser] = useState({});

  function handleSubmit(e) {

  const updateUser = (user) => setCurrentUser(user)

    e.preventDefault();

    fetch("/login", 
    {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify({ username, password }),
    })
    .then(res => {
      if(res.ok){
          res.json().then(user => {
            updateUser(user)
            console.log(`you are now ${user.username}`)
          })
      } else {
          res.json().then(json => setErrors(json.errors))
      }
    })
    .catch(res => console.log(res))

  }

  return (
    <div className="App">
      <form onSubmit={handleSubmit}>
      <input
        type="text"
        value={username}
        onChange={(e) => {setUsername(e.target.value)}}
      />
      <input
        type='password'
        value={password}
        onChange={(e) => {setPassword(e.target.value)}}
      />
      <button type="submit">Login</button>
    </form>
    {errors? <div>{errors}</div>:null}
    </div>
  );
}

export default App;
