const server=require("api/server")
server.app.listen(8800, () => {
  server.connect();
  console.log("Backend server is running!");
});
