import {Container} from 'semantic-ui-react'

function Resources (){

    return(
        <Container className='center'>
        <div className="ui segment">
            <h1>Helpful Resources</h1>
            <p>
            <a href="https://leetcode.com/" target="_blank" rel="noreferrer" > Leetcode </a>  
            </p>
            <p>
            <a href="https://neetcode.io/" target="_blank" rel="noreferrer"> Neetcode </a> 
            </p>
            <p>
            <a href="https://github.com/jwasham/coding-interview-university" target="_blank" rel="noreferrer"> Coding Interview University </a> 
            </p>
            <p>
            <a href="https://www.udemy.com/course/learning-data-structures-and-algorithms/" target="_blank" rel="noreferrer"> Udemy </a> 
            </p>
            <p>
            <a href="https://www.hackerrank.com/challenges/challenges/problem" target="_blank" rel="noreferrer"> HackerRank </a> 
            </p>

        </div>
        </Container>
    )
}

export default Resources