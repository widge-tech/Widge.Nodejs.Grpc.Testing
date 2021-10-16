import "reflect-metadata";
import { Server, ServerCredentials } from "@grpc/grpc-js";
import services from "../packages/grpc/greeter_grpc_pb";
import messages from "../packages/grpc/greeter_pb";

(async () => {
  const server = new Server();

  function sayHello(call: any, callback: any) {
    const reply = new messages.HelloReply();
    reply.setMessage(`Hello, ${call.request.getName()}! [from Nodejs]`);
    callback(null, reply);
  }

  server.addService(services.GreeterService as any, {
    sayHello,
  });

  server.bindAsync(
    "0.0.0.0:6000",
    ServerCredentials.createInsecure(),
    (error, port) => {
      if (error) {
        throw error;
      }
      server.start();
      console.log(`🚀  Server ready at ${port}`);
    }
  );
})();
