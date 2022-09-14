import AlgorithmCard from "./AlgorithmCard"
import {useEffect, useState} from "react";

function AlgorithmList({setErrors, errors})
{
    const [algorithms, setAlgorithms] = useState([]);

    useEffect(()=>{
    fetch("/algorithms")
    .then(res => res.json()).then(setAlgorithms)}, []); 

    return (
        <div className="ui segment">
            {algorithms.map((alg)=>(
                <AlgorithmCard 
                key = {alg.id}
                id = {alg.id}
                title = {alg.title}
                description = {alg.description}
                />
            ))}
        </div>
    )
}

export default AlgorithmList