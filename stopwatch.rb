# not available as multi-instance
class Stopwatch
  @start
  @end
  def initialize(s)
    @start = Time.now
    @end = nil
    print "Doing #{[s]} ... "
  end
  def stop()
    @end = Time.now
    puts "Finished in #{@end-@start} seconds."
  end
end
