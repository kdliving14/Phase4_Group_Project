import { useEffect, useState } from "react"
import { useParams } from "react-router-dom";
import { Form, TextArea, Input, Button, Divider } from "semantic-ui-react";
import ReactMarkdown from "react-markdown";

function AlgorithmPage({}){

    const params = useParams()
    const [isFormHidden, setIsFormHidden] = useState(true);

    const [alg, setAlg]=useState({})

    useEffect(()=>{
        fetch(`/algorithms/${params.id}`)
        .then(res=>{if(res.ok){res.json().then(res=>{setAlg(res)})}})
        .catch(res=>{console.log(res)})
    }, []); 
  
    return (
        <div className="ui segment">
            <h2 className="ui center aligned header">{alg.title}</h2>
            <ReactMarkdown>{alg.description}</ReactMarkdown>
            
            <Button fluid onClick={()=> setIsFormHidden(!isFormHidden)}>Create Solution</Button>
            
            <div hidden={isFormHidden}>
                <br></br>
            <Divider />
                <Form>
                    <br></br>
                    <Form.Group widths='equal'>
                        <Form.Field
                            control={Input}
                            label='Time Complexity'
                        />
                        <Form.Field
                            control={Input}
                            label='Space Complexity'
                        />
                    </Form.Group>
                    <Form.Field
                        control={TextArea}
                        label='Solution'
                        placeholder='Put your solution here...'
                        />
                        <Button fluid>Submit!</Button>
                </Form>
            </div>
        </div>
    )
}

export default AlgorithmPage