import { useEffect, useState } from "react"
import { useParams } from "react-router-dom";


function AlgorithmPage(){

    const params = useParams()

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
        <div>
            <h2>{alg.title}</h2>
            <p>{alg.description}</p>
            <button>Show Solutions</button>
        </div>
    )
}

export default AlgorithmPage