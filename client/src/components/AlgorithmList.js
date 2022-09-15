import AlgorithmCard from "./AlgorithmCard"
import {Card} from 'semantic-ui-react'

function AlgorithmList({algorithms})
{
    return (
        <div className="ui segment">
            <Card.Group>
            {algorithms.map((alg)=>(
                <AlgorithmCard 
                key = {alg.id}
                id = {alg.id}
                title = {alg.title}
                description = {alg.description}
                />
            ))}
            </Card.Group>
        </div>
    )
}

export default AlgorithmList