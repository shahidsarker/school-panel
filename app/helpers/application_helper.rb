module ApplicationHelper
  def abbreviate (string)
    abbrev = ''
    string.split(" ").each do |x|
      abbrev.insert(-1, x[0].upcase)
    end
    return abbrev
  end
end
