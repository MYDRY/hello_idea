module MandalartsHelper
  def show_sub_elem(subNum)
    content_tag(:div, id: subNum, class: 'col-xl-3', style: 'visibility: hidden;') do
      default_attributes = {type: 'sub', class: 'col-xl-3'}
      core_attributes = default_attributes.merge({ style: 'visibility: hidden; border: 1px dotted #999;'})
      (1..9).each do |n|
        attributes = (n == 5) ? core_attributes : default_attributes
        concat content_tag(:input, ' ', { id: "#{subNum}-#{n}" }.merge(attributes))
      end
    end
  end

  def show_core_elem
    content_tag(:div, id: 'core', class: 'col-xl-3') do
      get_attributes = lambda{|n| { id: "5-#{n}", type: 'core', class: 'col-xl-3'}}
      (1..9).each do |n|
        attributes = get_attributes.call(n)
        attributes.merge!(onchange: "animeTest1(#{n}, this.value)") unless n == 5
        concat content_tag(:input, ' ', attributes)
      end
    end
  end
end
