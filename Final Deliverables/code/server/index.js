const express = require('express');
const app = express();

const routeey = require('./routes/server_routes');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get("/", function (req, res) {
  //  res.json({ message: "API WORKS!!" });
    res.send("Server Rocking 🚀");
});


app.use("/", routeey )

const PORT = process.env.PORT   || 5000;

app.listen(PORT, () =>{
    console.log("listening  on port " + PORT);
});

//Mongo API
async function connectMongo(){
    await mongoose.connect("mongodb+srv://danushforibm:12345@cluster0.ibfdv3w.mongodb.net/userAccounts").then(function () {
});
}

setInterval(() =>{
    connectMongo();
}, 10);


