class Nameable
  def correct_name
    raise NotImplementedError "#{this.class} has not implemented method '#{__method__}'"
  end
end
