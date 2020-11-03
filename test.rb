require "webrick"
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
  })
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'exam.html.erb')
server.mount('/notself.cgi', WEBrick::HTTPServlet::CGIHandler, 'notself.rb')
server.mount('/falsequality.cgi', WEBrick::HTTPServlet::CGIHandler, 'falsequality.rb')
server.start
