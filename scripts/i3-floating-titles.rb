#!/bin/ruby

require "i3ipc"

con1 = I3Ipc::Connection.new
con2 = I3Ipc::Connection.new

block = Proc.new do |reply|
  if reply.change == 'floating'
    if reply.container.floating == 'user_off'
      con2.command("border pixel 3")
    elsif reply.container.floating == 'user_on'
      con2.command("border normal")
    end
  end
end

pid = con1.subscribe("window", block)
pid.join
