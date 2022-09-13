import React, { useState } from "react";
import  {Input, Form} from 'semantic-ui-react'

function Login({ updateUser }) {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);

  function handleSubmit(e) {
    
    e.preventDefault();

    fetch("/login", {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify({ username, password })
    })
    .then((r) => {
      if (r.ok) 
      {r.json().then(user => {updateUser(user)})}
      else
      {r.json().then((err) => setErrors(err.errors))}
    })
    .catch(res => {setErrors(res.errors); console.log(res)})
  }

  return (
    <div>
      <Form onSubmit={handleSubmit}>
        <h1>Login</h1>

        {errors ? <div>{errors}</div>:null}

        <label htmlFor="username">Username: </label>
        <Input
          type="text"
          id="username"
          autoComplete="off"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <br></br>
        <label htmlFor="password">Password: </label>
        <Input
          type="password"
          id="password"
          autoComplete="current-password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <br></br>
        <button type="submit" className="ui button">Login</button>
        <br></br>
      </Form>
      
    </div>
  );
}

export default Login;