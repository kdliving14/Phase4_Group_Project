import { useEffect, useState } from "react"
import { useParams } from "react-router-dom";

import Solutions from "./Solutions";


function AlgorithmPage(){

    const params = useParams()
    const [isSolutionHidden, setIsSolutionHidden] = useState(true);

    const [alg, setAlg]=useState({})
    let solutions = []

    useEffect(()=>{
        fetch(`/algorithms/${params.id}`)
        .then(res=>{
            if(res.ok){
                res.json()
                .then(res=>{setAlg(res)})
            }})
        .catch(res=>{
            console.log(res)
        })
    }, []); 

    solutions = alg.solutions
    
    // console.log(solutions[0].id)
    // console.log(isSolutionHidden)

    return (
        <div className="ui segment">
            <h2 className="ui center aligned header">{alg.title}</h2>
            <p>{alg.description}</p>
            <div className="ui two bottom attached buttons">
            <button className="ui button">Create Solution</button>
            {/* <button className="ui button" onClick={()=> setIsSolutionHidden(!isSolutionHidden)}>Show Solutions</button> */}
            </div>
            <div hidden={isSolutionHidden}>
                {/* <Solutions id = {alg.solutions.id}/> */}
                {/* {solutions.map((s)=>{
                    
                    <Solutions 
                        key = {s.id}
                        id = {s.id}
                        solution ={s.solution}
                        time = {s.time_complexity}
                        space = {s.space_complexity}
                    />
                })}  */}
                
            </div>
        </div>
    )
}

export default AlgorithmPage