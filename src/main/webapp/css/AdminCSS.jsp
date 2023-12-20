@charset "UTF-8";

h1{
   font-size: 50px;
   line-height: 60px;
   font-weight: 500;
}
.container-space {
    margin-top: 30px;
/* background-color: rgb(143, 139, 139); */
}
.cont-row{
display: flex;
align-items: center;
justify-content: center;
margin: 0 50px 0 0;
}
.pro-cart{
    display: block;
    background-color: white;
    width: 20%;
    height: 210px;
    border: blueviolet;
    border: 2px solid wheat;
    border-radius: 10px;
    margin: 5px 25px 4px 5px;
    justify-content: center;
    align-items: center;
    text-align: center;
    box-shadow: 5px 5px 15px rgb(100, 69, 100);
    background-image: url();
}
.pro-cart h4{
    text-align: start;
    font-weight: 500;
    font-size: 20px;
    color: rgb(117, 69, 129);
    /* margin: 10px 5px 10px 0; */
    padding: 10px 5px 10px 0;
}
.pro-cart h1{
    padding: 10px 30px;
    font-size: 34px;
    font-weight: 600;
    /* margin: 10px 5px 10px 0; */
}
.pro-cart p{
    justify-content: center;
    text-align: start;
    font-size: 20px;
    font-weight: 500;
    padding:  0 10px 0 0;
    color: rgb(143, 130, 130);
}
.chart {
    display: flex;
    flex-direction: column;
    /*align-items: start;  Align the content to the right */
    text-align: start; /* Align text to the right */
    margin: 50px 0 0 0 ;
}

.chart .img {
    margin: 0 120px; /* Move the image to the right */
    width: 100%;
}
.chart h3{
    /* text-align: center; */
    margin: 10px 20px 40px 130px;
}

.sidebar{
justify-content: center;
text-align: start;
padding: 20px;
border: 3px solid rgb(143, 130, 130);
border-bottom: 0;
border-top: 0;
border-left: 0;
border-color: blueviolet;
margin: 0 0 1px 0;
}
.sidebar a{
    text-decoration: none;
    font-size: 20px;
    color: darkmagenta;
    font-weight: 500;
    margin: 10px 0 5px 0;
}

.sidebar a:hover{
color: black;
font-weight:400;
}
.sidebar a:hover::after{
    content: "";
    width: 50%;
    height: 2px;
    /* background-color: white; */
    background-color: darkmagenta;
    position: absolute;
    bottom: -10px;
    left: 20px;
}