const server=require("/api/server.js")
server.app.listen(8800, () => {
  server.connect();
  console.log("Backend server is running!");
});
