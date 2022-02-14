const express = require("express")
const app = express()

app.get("/", (req, res) =>
  res.send("This is Mohit's nodeJS docker container running")
)

app.listen(3000, () => {
  console.log("my project running on port 3000")
})
