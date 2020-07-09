class Numeric
  def sign
    "++-"[self <=> 0]
  end

  def same_sign?(numeric)
    self.sign == numeric.sign
  end
end
