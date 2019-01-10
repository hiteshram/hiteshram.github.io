// console.log("Hello world");
// var check="how are you";
// console.log(check);
// check=4;
// console.log(check);

// var value_var="initialised"
// let value_let="initialised"
// function check(){
//     console.log(value_var);
//     console.log(value_let);
//     value_var="reassigned"
//     value_let="reassigned"
//     if(true){
//         value_let="updated";
//         console.log(value_let);
//     }
//     console.log(value_var);
//     console.log(value_let);
// }
// check();
// console.log(value_var);
// console.log(value_let);
<html>
<head>
<script type="text/javascript">
const fetch = require("node-fetch");
fetch("http://quotes.rest/qod.json?category=inspire")
.then(res => res.json())
.then((out) => {
    //var obj=JSON.parse(out);
    console.log(out['contents']['quotes'][0]['quote']);
    console.log(out['contents']['quotes'][0]['author']);
}).catch(err => console.error(err));
</script>
</head>
<body>
</body>
</html>