const express = require("express")
const mongoose = require("mongoose")
const userRoute = require("./routes/user")
const profileRoute = require("./routes/profile")

mongoose.connect('mongodb://localhost:27017/test',
    {
        useNewUrlParser: true,
        useUnifiedTopology: true
    }, () => { console.log("Mongodb connected"); });
const app = express();
app.use(express.json())
const Port = process.env.port || 5000

app.route("/").get((req, res) => {
    res.json("your first rest api")
});
app.use("/user", userRoute)
app.use("/profile", profileRoute)


app.listen(Port, () => console.log(`you server is running on port ${Port}`));