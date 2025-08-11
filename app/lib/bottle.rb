class Bottle
  SIZES = ["small", "medium", "large"]

  def size_in_oz
    {
      "small": 8,
      "medium": 16,
      "large": 32
    }[size]
  end
end
