import {Card, Button, Icon} from 'semantic-ui-react'
import { ReactMarkdown } from 'react-markdown/lib/react-markdown'
import {Link} from "react-router-dom"

function SolutionCard({id, solution, alg, time, space, user, deleteSolution, currentUser}){
    console.log(`user: ${user}`)
    console.log(`currentUser.id: ${currentUser.id}`)

    function handleDelete(){
        if(user === currentUser.id){
            fetch(`/solutions/${id}`, {method: "DELETE"})
            deleteSolution(id)
        }
        else{
            alert("You can't delete someone else's solution!")
        }
    }
    
    return(
        <Card className='ui centered card'>
            <Card.Content header={`Algorithm #: ${alg}`} />
            {solution}
            <Card.Content extra>
                <h4>Complexity</h4>
                Time: {time} | Space: {space}
            </Card.Content>
            <Button className='ui red button' onClick={handleDelete}>Delete Solution?</Button>
        </Card>
    )
}
export default SolutionCard
