require 'drb/drb'

DRb.start_service('druby://127.0.0.1:13500', Hash.new)
puts DRb.uri
DRb.thread.join



