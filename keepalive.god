APP_ROOT = File.expand_path('../', __FILE__)
God.watch do |w|
  w.name = "singleton"
  w.pid_file = File.join(APP_ROOT, "tmp/singleton.pid")
  w.log = File.join(APP_ROOT, "log/singleton.log")
  w.start = "#{APP_ROOT}/singleton"
  w.stop = "#{APP_ROOT}/singleton stop"
  w.restart = "#{APP_ROOT}/singleton restart"
  w.behavior(:clean_pid_file)
  w.interval = 5.seconds
  w.start_if do |start|
    start.condition(:process_running) do |c|
      c.interval = 5.seconds
      c.running = false
    end
  end
  w.restart_if do |restart|
    restart.condition(:memory_usage) do |c|
      c.above = 150.megabytes
      c.times = [3, 5] # 3 out of 5 intervals
    end
  end
end