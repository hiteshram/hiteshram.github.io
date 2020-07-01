
var restart=document.querySelector("#b");
var squares=document.querySelectorAll("td");
var counter=1
var playerOne=""
var playerTwo=""

function getNames(){
  var n1 = document.querySelector('#player1');
  var n2 = document.querySelector('#player2');
  playerOne=n1.value
  playerTwo=n2.value
}



function clearBoard(){
  for(var i=0;i<squares.length;i++){
    squares[i].textContent='';
  }
  var winner=document.querySelector("#won");
  winner.textContent=""
}

function changeMarker(){
  if(this.textContent==="" && counter%2==1){
    this.textContent="X";
    counter=counter+1;
  }
  else if(this.textContent==="" && counter){
    this.textContent="O"
    counter=counter+1
  }

}

for(var i=0;i<squares.length;i++){
  squares[i].addEventListener('click',changeMarker)
  squares[i].addEventListener('click',validateGame)
}

function validateGame(){
  cellOne=document.querySelector('#one')
  cellTwo=document.querySelector("#two")
  cellThree=document.querySelector("#three")
  cellFour=document.querySelector("#four")
  cellFive=document.querySelector("#five")
  cellSix=document.querySelector("#six")
  cellSeven=document.querySelector("#seven")
  cellEight=document.querySelector("#eight")
  cellNine=document.querySelector("#nine")

  var c1=cellOne.textContent
  var c2=cellTwo.textContent
  var c3=cellThree.textContent
  var c4=cellFour.textContent
  var c5=cellFive.textContent
  var c6=cellSix.textContent
  var c7=cellSeven.textContent
  var c8=cellEight.textContent
  var c9=cellNine.textContent

  var isWonX=false
  var isWonO=false
  var isDraw=false

  if(c1==='X' && c2==='X' && c3==="X"){
    isWonX=true
  }else if(c4==='X' && c5==='X' && c6==="X"){
    isWonX=true
  }else if(c7==='X' && c8==='X' && c9==="X"){
    isWonX=true
  }else if(c1==='X' && c4==='X' && c7==="X"){
    isWonX=true
  }else if(c2==='X' && c5==='X' && c8==="X"){
    isWonX=true
  }else if(c3==='X' && c6==='X' && c9==="X"){
    isWonX=true
  }else if(c1==='X' && c5==='X' && c9==="X"){
    isWonX=true
  }else if(c7==='X' && c5==='X' && c3==="X"){
    isWonX=true
  }

  if(c1==='O' && c2==='O' && c3==="O"){
    isWonO=true
  }else if(c4==='O' && c5==='O' && c6==="O"){
    isWonO=true
  }else if(c7==='O' && c8==='O' && c9==="O"){
    isWonO=true
  }else if(c1==='O' && c4==='O' && c7==="O"){
    isWonO=true
  }else if(c2==='O' && c5==='O' && c8==="O"){
    isWonO=true
  }else if(c3==='O' && c6==='O' && c9==="O"){
    isWonO=true
  }else if(c1==='O' && c5==='O' && c9==="O"){
    isWonO=true
  }else if(c7==='O' && c5==='O' && c3==="O"){
    isWonO=true
  }


  if((c1!=='')&&(c2!=='')&&(c3!=='')&&(c4!=='')&&(c5!=='')&&(c6!=='')&&(c7!=='')&&(c8!=='')&&(c9!=='')){
    if((!isWonX) && (!isWonO)){
        isDraw=true
    }
  }


  var winner=document.querySelector("#won");
  if(isWonX){
    if(playerOne===""){
      winner.textContent= "X has won the game!"
    }else {
        winner.textContent= playerOne+" has won the game!"
    }
    }else if(isWonO){
      if(playerTwo===""){
        winner.textContent="O has won the game!"
      }else{
        winner.textContent=playerTwo+" has won the game!"
      }
  }else if(isDraw){
    winner.textContent="Game is a Draw!!"
  }
}


restart.addEventListener('click',clearBoard);
