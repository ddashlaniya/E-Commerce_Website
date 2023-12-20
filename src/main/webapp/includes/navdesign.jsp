<!-- ul {  
  list-style-type: none;  
  margin: 0;  
  padding: 0px;  
  overflow: hidden;  
  background-color: lightgray;  
}  
  
li {  
  float: left;  
}  
  
li a {  
  display: block;  
  color: blue;  
 font-size:20px;  
  text-align: center;  
  padding: 10px 20px;  
  text-decoration: none;  
}  
.active{  
background-color: gray;  
color: white;  
}  
li a:hover {  
  background-color: orange;  
  color: white;  
}  
 -->
 
 
 
h1{
    font-size: 50px;
    line-height: 60px;
    color: black;
}
h2{
    font-size: 40px; 
    line-height: 50px;
    /* font-weight: 10; */
    color: black;
}
h4{
    font-size: 30px;
}
h6{
    
    font-weight: 590;
    font-size: 15px;
    color: black;
}
body{
    width: 100%;
}
#header{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px 80px;
    /* background: rgb(54, 44, 44); */
    background: rgb(169, 146, 187);
    box-shadow: 0 5px 15px red(0,0,0,0.6);
    
}
#navbar{
    display: flex;
    align-items: center;
    justify-content: center;
    
}
#navbar li{
    list-style: none;
    padding: 0 20px;
    float: right;
    position: relative;
}
#navbar li a{
    text-decoration: none;
    font-size: 20px;
    font-weight: 600;
    color: darkmagenta;
    transition: 0.4s;
}


/* Style Search Bar */
/* styling search bar */
.search input[type=text]{
    width:300px;
    height:25px;
    border-radius:25px;
    border: none;

}

.search{
    float:right;
    margin:7px;

}

.search button{
    background-color:rgb(169, 146, 187);
    color: darkmagenta;
    float: right;
    padding: 2px 10px;
    margin-right: 16px;
    font-size: 15px;
    border: none;
    cursor: pointer;
}
/* .input-action{
    color: mediumorchid;
} */

#navbar li a:hover,
#navbar li a.active{
    color: white;
}

.search button:hover{
    color: white;
}

#navbar li a.active::after,
#navbar li a:hover::after {     /* write this one are also work similar #navbar li a.active::after{*/
content: "";
width: 40%;
height: 4px;
background-color: white;
position: absolute;
bottom: -5px;
left: 20px;
}