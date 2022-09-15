import {Card} from 'semantic-ui-react'

function SolutionCard({solution, alg, time, space}){
    return(
        <Card className='center'>
            <Card.Content header={`Algorithm #: ${alg}`} />
            <Card.Content description={solution} />
            <Card.Content extra>
            <h4>Complexity</h4>
            Time: {time} | Space: {space}
            </Card.Content>
        </Card>
    )
}
export default SolutionCard