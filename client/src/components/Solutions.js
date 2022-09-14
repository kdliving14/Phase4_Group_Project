import {useEffect, useState} from "react"
import SolutionCard from "./SolutionCard";

function Solutions()
{
    const [sol, setSol]=useState({})

    useEffect(()=>{
        fetch("/solutions")
        .then(res => res.json()).then(setSol)}, [])
        

    return(
    <div className="ui segment">
        {sol.map((s)=>(
                <SolutionCard 
                key ={s.id}
                id = {s.id}
                alg = {s.algorithm_id}
                time ={s.time_complexity}
                space ={s.space_complexity}
                solution = {s.solution}
                />
            ))}
    </div>)
    
}
export default Solutions