const module={}
import ( "./api/server").then(d=>module);
//const server=require("api/server.js")
module.app.listen(8800, () => {
module.connect();
  console.log("Backend server is running!");
});
