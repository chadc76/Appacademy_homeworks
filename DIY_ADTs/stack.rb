class Stack
    attr_reader :stack
  def initialize
    @stack = []
  end
  
  def push(el)
    stack.push(el)
  end
  
  def pop(n = 1)
    stack.pop
  end
  
  def peek
    stack.last
  end
end