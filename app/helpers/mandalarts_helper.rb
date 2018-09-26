module MandalartsHelper
  def show_sub_elem(subNum)
    html_text = ''
    default_attributes = {type: 'text', class: 'col-xl-3'}
    core_attributes = {type: 'text', class: 'col-xl-3', style: 'visibility: hidden;'}
    (1..9).each do |n|
      attributes = (n == 5) ? core_attributes : default_attributes
      html_text += content_tag(:input, ' ', { id: subNum.to_s + '-' + n.to_s }.merge(attributes))
    end
    html_text.html_safe
  end

end
