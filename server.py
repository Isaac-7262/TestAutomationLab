
from __future__ import print_function
from os import chdir
from os.path import abspath, dirname
import sys

if sys.version_info[0] < 3:
    from SocketServer import ThreadingMixIn
    from BaseHTTPServer import HTTPServer
    from SimpleHTTPServer import SimpleHTTPRequestHandler
else:
    from socketserver import ThreadingMixIn
    from http.server import SimpleHTTPRequestHandler, HTTPServer

ROOT = dirname(abspath(__file__))
PORT = 7272


class DemoServer(ThreadingMixIn, HTTPServer):
    allow_reuse_address = True

    def __init__(self, port=PORT):
        handler = SimpleHTTPRequestHandler
        super(DemoServer, self).__init__(('localhost', int(port)), handler)

    def start(self, directory=ROOT):
        chdir(directory)
        print(f"Serving HTTP on port {self.server_port} (http://localhost:{self.server_port}/)")
        try:
            self.serve_forever()
        except KeyboardInterrupt:
            print("\nShutting down server.")
            self.server_close()


if __name__ == '__main__':
    try:
        server = DemoServer(*sys.argv[1:])
        server.start()
    except (TypeError, ValueError) as e:
        print("Invalid port number")
        print(e)