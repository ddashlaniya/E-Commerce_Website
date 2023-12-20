h1 {
    font-size: 50px;
    line-height: 60px;
    color: black;
}

h2 {
    font-size: 40px;
    line-height: 50px;
    /* font-weight: 10; */
    color: black;
}

h4 {
    font-size: 30px;
}

h6 {

    font-weight: 590;
    font-size: 15px;
    color: black;
}

body {
    width: 100%;
    /* background-image: url(Backgroundpng.png);
    background-attachment: fixed;
    background-size: cover; */
}

#header {  
     display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px 80px;
    /* background: rgb(54, 44, 44); */
    /* background: rgb(169, 146, 187); */
    background: white;
    box-shadow: 15px 5px 15px rgb(169, 146, 187);
    z-index: 999;
    position: sticky;
    width: 100%;
    height:90px;
    top: 0;
    left: 0;
}

#navbar {
    display: flex;
    align-items: center;
    justify-content: center;


}

#navbar li {
    list-style: none;
    padding: 0 20px;
    float: right;
    position: relative;
}

#navbar li a {
    text-decoration: none;
    font-size: 20px;
    font-weight: 600;
    color: darkmagenta;
    transition: 0.4s;
}


/* Style Search Bar */
/* styling search bar */
.search input[type=text] {
    width: 300px;
    height: 25px;
    border-radius: 25px;
    border: none;

}

.search {
    float: right;
    margin: 7px;

}

.search button {
    background-color: rgb(169, 146, 187);
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
#navbar li a.active {
    color: black;
}

.search button:hover {
    color: white;
}

#navbar li a.active::after,
#navbar li a:hover::after {
    /* write this one are also work similar #navbar li a.active::after{*/
    content: "";
    width: 40%;
    height: 4px;
   <!--  background-color: white; -->
   background-color: red;
    position: absolute;
    bottom: -10px;
    left: 20px;
}

/*Droupdoun Content Start*/
.dropdown {
    position: relative;
    display: inline-block;
  }
  
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    padding: 12px 16px;
    z-index: 1;
  }
  
  .dropdown:hover .dropdown-content {
    display: block;
  }
  .dropdown:hover .dropdown-content li{
  text-align: start;
  }
  .dropdown span i{
    font-size: 30px;
    color: darkmagenta;
    
  }
/*Drowpdown Content end*/
