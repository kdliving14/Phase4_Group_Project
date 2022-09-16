import {Container} from 'semantic-ui-react'

function Home (){

    return(
        <Container className='center'>
        <div className="ui segment">
            <h1>About the Project</h1>
            <p>
                Knock off of LeetCode 🙂
            </p>

            <h1>About us:</h1>
            <p>
            Karter L. 
            ---
            <a href="https://github.com/kdliving14" target="_blank" > Github </a>  
            ---
            <a href="https://www.linkedin.com/in/karter-livingston/" target="_blank"> LinkedIn </a> 
            </p>
            <p>
            Loren W.
            ---
            <a href="https://github.com/LorenWilks" target="_blank" > Github </a> 
            ---
            <a href="https://www.linkedin.com/in/loren-wilks-719a8019b/" target="_blank">LinkedIn</a> 
            </p>
            <p>
            Brian H.
            ---
            <a href="https://github.com/bandily" target="_blank"> Github </a> 
            ---
            <a href="https://www.linkedin.com/in/brianshuynh/" target="_blank"> LinkedIn </a> 
            </p>
            <p>
            Tommy N.
            ---
            <a href="https://github.com/Gnomedealer" target="_blank"> Github </a> 
            ---
            <a href="https://www.linkedin.com/in/tommy-nguyen-9a3b90122/" target="_blank"> LinkedIn </a> 
            </p>

        </div>
        </Container>
    )
}

export default Home