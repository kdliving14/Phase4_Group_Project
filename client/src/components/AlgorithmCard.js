import {Icon, Button, Card} from 'semantic-ui-react'
import {Link} from "react-router-dom"

function AlgorithmCard({title, id}){
    return(
        <Card className='center'>
            <Card.Content>
            <Card.Header>{title}</Card.Header>
            <Link to={`/algorithms/${id}`}>
                <Button size='large'><Icon name='code' />Code!</Button>
            </Link>
            </Card.Content>
        </Card>
    )
}
export default AlgorithmCard