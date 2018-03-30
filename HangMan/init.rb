APP_ROOT = File.dirname(__FILE__)
$:.unshift( File.join(APP_ROOT, "lib") )
require 'guide'


game = Guide.new
game.load_game?
