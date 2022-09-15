import { useEffect, useState } from "react"
import { useParams } from "react-router-dom";
import { Form, TextArea, Input, Button, Divider, Embed} from "semantic-ui-react";
import ReactMarkdown from "react-markdown";

function AlgorithmPage({formData, setFormData, addSolution, user}){

    const params = useParams()

    const [isFormHidden, setIsFormHidden] = useState(true);
    const [alg, setAlg]=useState({})

    const {solution, time_complexity, space_complexity, user_id, algorithm_id}=formData

    const newSolution={
        solution: solution, 
        time_complexity: time_complexity, 
        space_complexity: space_complexity, 
        user_id: user_id, 
        algorithm_id: algorithm_id
    }

    const blankSolution={
        user_id:"",
        algorithm_id:"",
        time_complexity:"",
        space_complexity:"",
        solution:""  
    }

    useEffect(()=>{
        fetch(`/algorithms/${params.id}`)
        .then(res=>{if(res.ok){res.json().then(res=>{setAlg(res)})}})
        .catch(res=>{console.log(res)})
    }, []); 
  

    function handleChange(e){
        const {name, value} =e.target;
        setFormData((formData)=>{return {...formData, [name]: value,
            user_id: user.id,
            algorithm_id: parseInt(params.id)
        }})
    }

    function handleSubmit(e){
        e.preventDefault();
        fetch("/solutions",
        {
            method: "POST",
            headers: {"Content-Type":"application/json"},
            body: JSON.stringify(newSolution)
        })
        .then((s)=>s.json())
        .then((s)=> addSolution(s))
        .then(()=>setFormData(blankSolution))
        alert("Thank you for Submitting!")
    }

    return (
        <div className="ui segment">
            <h2 className="ui center aligned header">{alg.title}</h2>
            <ReactMarkdown>{alg.description}</ReactMarkdown>
            
            <Button fluid onClick={()=> setIsFormHidden(!isFormHidden)}>Create Solution</Button>
            
            <div hidden={isFormHidden}>
                <br></br>
            <Divider />
            <div className="center">vv Click here for a code sandbox vv</div>
            <Embed url="https://codesandbox.io/embed/new?codemirror=1"/>
                <Form >
                    <br></br>
                    <Form.Group widths='equal'>
                        <Form.Field
                            name='time_complexity'
                            value={time_complexity}
                            control={Input}
                            label='Time Complexity'
                            onChange={handleChange}
                        />
                        <Form.Field
                            name='space_complexity'
                            value={space_complexity}
                            control={Input}
                            label='Space Complexity'
                            onChange={handleChange}
                        />
                    </Form.Group>
                    <Form.Field
                        name='solution'
                        value={solution}
                        control={TextArea}
                        label='Solution'
                        placeholder='Put your solution here...'
                        onChange={handleChange}
                        />
                        <Button fluid onClick={handleSubmit}>Submit!</Button>
                </Form>
            </div>
        </div>
    )
}

export default AlgorithmPage
