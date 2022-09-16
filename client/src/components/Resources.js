import {Container} from 'semantic-ui-react'

function Resources (){

    return(
        <Container className='center'>
        <div className="ui segment">
            <h1>Helpful Resources</h1>
            <p>
            <a href="https://leetcode.com/" target="_blank" > Leetcode </a>  
            </p>
            <p>
            <a href="https://neetcode.io/" target="_blank" > Neetcode </a> 
            </p>
            <p>
            <a href="https://github.com/jwasham/coding-interview-university" target="_blank"> Coding Interview University </a> 
            </p>
            <p>
            <a href="https://www.udemy.com/course/learning-data-structures-and-algorithms/" target="_blank"> Udemy </a> 
            </p>
            <p>
            <a href="https://www.hackerrank.com/challenges/challenges/problem" target="_blank"> HackerRank </a> 
            </p>

        </div>
        </Container>
    )
}

export default Resources