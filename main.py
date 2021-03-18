import cherrypy
import wsgiref.handlers
import time
import socket 

class RootUrl:
  @cherrypy.expose
  def index(self):
    f=open('/mnt/data/filex.log','a')
    f.write('%s %f\n'%( socket.gethostname(),  time.time()))
    f.close()
    return "Hello world ola mundo %s"%( socket.gethostname()  )

class Middle:
  @cherrypy.expose
  def index(self):
    return "middle"

class GoodbyeWorld:
   @cherrypy.expose
   def index(self,num=None):
     return "Goodbye World!"

def main():
  ru = RootUrl()
  ru.middle = Middle()
  ru.middle.goodbye  = GoodbyeWorld()
  cherrypy.server.socket_host = '0.0.0.0'
  cherrypy.quickstart(ru) 

if __name__ == '__main__':
  main()

