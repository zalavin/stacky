require_relative 'stacky/stacky'

namespace :stacky do
  STACKY_PID = '/tmp/stacky.pid'.freeze

  task :start do
    Process.daemon(true, true)
    File.write(STACKY_PID, Process.pid)
    Signal.trap('TERM') { abort }
    Stacky.new.perform
  end

  task :kill do
    system("kill `cat #{STACKY_PID}`")
  end
end
