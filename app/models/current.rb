require 'request_locals'
# Store values for items referred to as current for the thread
module Current
  def self.forward_attrs(to, *names)
    names.each do |name|
      line = __LINE__; self.instance_eval %{
        def #{name}
          #{to}[:#{name}]
        end
        
        def #{name}=(value)
          #{to}[:#{name}] = value
        end
      }, __FILE__, line
    end
  end
  
  forward_attrs :RequestLocals, :user, :location
end