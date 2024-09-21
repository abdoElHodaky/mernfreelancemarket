import app,connect from "./api/server";
//const server=require("api/server.js")
app.listen(8800, () => {
  connect();
  console.log("Backend server is running!");
});
