import AlgorithmCard from "./AlgorithmCard"
import {Card, Container} from 'semantic-ui-react'

function AlgorithmList({algorithms})
{
    return (
        <div className="ui segment">
            <Container>
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
            </Container>
        </div>
    )
}

export default AlgorithmList