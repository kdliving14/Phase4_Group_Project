import React, { useState } from "react";
import  {Form} from 'semantic-ui-react'
import {useNavigate} from "react-router-dom"

function Login({ updateUser, setErrors, errors }) {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const navigate = useNavigate();

  function handleSubmit(e) {
    
    e.preventDefault();

    fetch("/login", {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify({ username, password })
    })
    .then((r) => {
      if (r.ok) 
      {r.json().then(user => {updateUser(user)
        navigate(`/`)})}
      else
      {r.json().then((err) => setErrors(err.errors))}
    })
    .catch(res => {setErrors(res.errors); console.log(res)})
  }

  return (
    <div className="ui placeholder segment">
      
      <div className="column">
      <Form onSubmit={handleSubmit}>
      <div className="field">
      <h1>Login</h1>
        <label htmlFor="username">Username: </label>
        <div className="ui left icon input">
            <input 
              type="text" 
              id="username"
              autoComplete="off"
              value={username}
              onChange={(e) => setUsername(e.target.value)}/>
            <i className="user icon"></i>
          </div>
        </div>
     
        <div className="field">
          <label>Password</label>
          <div className="ui left icon input">
            <input type="password"
            id="password"
            autoComplete="current-password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}/>
            <i className="lock icon"></i>
          </div>
          {errors ? <div>{errors}</div>:null}
        </div>
        <button type="submit" className="ui blue submit button">Login</button>
      </Form>
      </div>
      </div>
  );
}

export default Login;