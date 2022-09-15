import {Card, Button} from 'semantic-ui-react'

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
        <Card className='center'>
            <Card.Content header={`Algorithm #: ${alg}`} />
            <Card.Description>
            {solution}
            </Card.Description>
            <Card.Content extra>
                <h4>Complexity</h4>
                Time: {time} | Space: {space}
            </Card.Content>
            <Button onClick={handleDelete}>Delete Solution?</Button>
        </Card>
    )
}
export default SolutionCard