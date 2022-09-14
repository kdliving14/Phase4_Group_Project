import { useEffect, useState } from "react"
import { useParams } from "react-router-dom";
import Solutions from "./Solutions";
import ReactMarkdown from "react-markdown";


function AlgorithmPage({}){

    const params = useParams()
    const [isSolutionHidden, setIsSolutionHidden] = useState(true);

    const [alg, setAlg]=useState({
        title: "",
        description:""
    })

    useEffect(()=>{
        fetch(`/algorithms/${params.id}`)
        .then(res=>{
            if(res.ok){
                res.json()
                .then(res=>setAlg(res))
            }})
        .catch(res=>{
            console.log(res)
        })
    }, []); 

    return (
        <div className="ui segment">
            <h2 className="ui center aligned header">{alg.title}</h2>
            <ReactMarkdown>{alg.description}</ReactMarkdown>
            <div className="ui two bottom attached buttons">
            <button className="ui button">Create Solution</button>
            <button className="ui button" onClick={()=> setIsSolutionHidden(!isSolutionHidden)}>Show Solutions</button>
            </div>
            <div hidden={isSolutionHidden}>
                <p>
                    {console.log(alg.solutions)
                    // an array of objects ^
                    // .map((sol)=>())?
                    }
                </p>
            </div>
        </div>
    )
}

export default AlgorithmPage