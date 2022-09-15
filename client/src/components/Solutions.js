import SolutionCard from "./SolutionCard";
import {Card} from 'semantic-ui-react'

function Solutions({sol, deleteSolution, currentUser})
{
    return(
    <div className="ui segment">
        <Card.Group>
        {sol.map((s)=>(
                <SolutionCard 
                key ={s.id}
                id = {s.id}
                alg = {s.algorithm_id}
                time ={s.time_complexity}
                space ={s.space_complexity}
                solution = {s.solution}
                user ={s.user.id}
                currentUser = {currentUser}
                deleteSolution ={deleteSolution}
                />
            ))}
        </Card.Group>
    </div>)
    
}
export default Solutions