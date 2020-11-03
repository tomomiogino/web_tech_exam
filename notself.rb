require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['notself']
  "<html>
    <body>
      <p>譲渡先が自家消費ではないゴーヤの大きさと売った相手の情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}
