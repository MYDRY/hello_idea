module MandalartsHelper
  def show_sub_elem(subNum)
    html_text = ''
    default_attributes = {type: 'text', class: 'col-xl-3'}
    core_attributes = default_attributes.merge({ style: 'visibility: hidden;'})
    (1..9).each do |n|
      attributes = (n == 5) ? core_attributes : default_attributes
      html_text += content_tag(:input, ' ', { id: "#{subNum}-#{n}" }.merge(attributes))
    end
    html_text.html_safe
  end

  def show_core_elem
    html_text = ''
    get_attributes = lambda{|n| { id: "5-#{n}", type: 'text', class: 'col-xl-3'}}
    (1..9).each do |n|
      attributes = get_attributes.call(n)
      attributes.merge!(onchange: "animeTest1(#{n}, this.value)") unless n == 5
      html_text += content_tag(:input, ' ', attributes)
    end
    html_text.html_safe
  end
end
