class Nameable
  def correct_name
    raise NotImplementedError "#{this.class} has not implemented '#{__method__}'"
  end
end