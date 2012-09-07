class Object
  def ivget ivar
   instance_variable_get ivar
  end
  def ivset ivar, value
    instance_variable_set ivar value
  end
end