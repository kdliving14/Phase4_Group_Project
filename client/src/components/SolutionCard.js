import {Card} from 'semantic-ui-react'
import ReactMarkdown from "react-markdown";

function SolutionCard({solution, alg, time, space}){
    return(
        <Card className='center'>
            <Card.Content header={`Algorithm #: ${alg}`} />
            <Card.Description>
            {solution}
            </Card.Description>
            <Card.Content extra>
            <h4>Complexity</h4>
            Time: {time} | Space: {space}
            </Card.Content>
        </Card>
    )
}
export default SolutionCard