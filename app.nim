import asynchttpserver, asyncdispatch, os, strutils

var server = newAsyncHttpServer()
proc cb(req: Request) {.async.} =
  await req.respond(Http200, "Hello World")

var port: Port

if os.existsEnv("PORT"):
  let number = os.getEnv("PORT").parseUInt()
  port = Port(number)
else:
  port = Port(9999)


waitFor server.serve(port, cb)