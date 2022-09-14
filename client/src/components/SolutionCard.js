import {Card} from 'semantic-ui-react'

function SolutionCard({solution, id, alg, time, space}){
    return(
        <Card>
            <p>Algorithm: {alg}</p>
            <p>Time Complexity: {time}</p>
            <p>Space Complexity: {space}</p>
            <p>{solution}</p>
        </Card>
    )
}
export default SolutionCard