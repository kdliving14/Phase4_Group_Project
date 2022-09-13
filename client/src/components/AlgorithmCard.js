import {Icon, Button} from 'semantic-ui-react'
import {Link} from "react-router-dom"

function AlgorithmCard({title, id}){
    return(
        <div>
            <br></br>
            <Link to={`/algorithms/${id}`}>
                <Button size='large'><Icon name='code' />{title}</Button>
            </Link>
            <br></br>
        </div>
    )
}
export default AlgorithmCard