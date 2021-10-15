import "reflect-metadata";
import { Server, ServerCredentials } from "@grpc/grpc-js";
import services from "../packages/grpc/greeter_grpc_pb";
import messages from "../packages/grpc/greeter_pb";

(async () => {
  console.log("Hello World!");

  const server = new Server();

  function sayHello(call: any, callback: any) {
    const reply = new messages.HelloReply();
    reply.setMessage("Hello " + call.request.getName());
    callback(null, reply);
  }

  server.addService(services.GreeterService as any, {
    sayHello,
  });

  server.bindAsync("localhost:6000", ServerCredentials.createInsecure(), () => {
    server.start();
  });
})();
