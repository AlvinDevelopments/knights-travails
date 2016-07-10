class Queue

  def initialize
    @data = []
    @end_index = 0
  end

  def enqueue(item)
    @data[@end_index] = item
    @end_index+=1
    return item
  end

  def dequeue
    return if empty?

    result = @data[0]
    counter = 0

    while(!@data[counter].nil?)
      @data[counter] = @data[counter+1]
      counter +=1
    end
    @end_index-=1


    return result
  end


  def peek
    @data[0]
  end

  def empty?
    return true if @end_index == 0
    return false
  end

end
