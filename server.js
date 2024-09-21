const server=require("api/server")
server.listen(8800, () => {
  connect();
  console.log("Backend server is running!");
});
