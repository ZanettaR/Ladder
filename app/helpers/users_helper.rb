module UsersHelper
  def options_for_gender
    [
      ['Female', 'female'],
      ['Male','male'],
      ['Other', 'other']
    ]
  end

  def options_for_birth_year
    ((Date.today.year - 65)..(Date.today.year - 16)).to_a.reverse
  end

  def options_for_photo
    [
      ['Default', 'default'],
      ['Dog','dog'],
      ['Cat', 'cat'],
      ['Monkey', 'monkey'],
      ['Pig', 'pig'],
      ['Fox', 'fox']
    ]
  end
end
