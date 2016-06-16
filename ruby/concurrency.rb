Thread.list.each do |thread|
  thread.exit unless thread == Thread.current
end