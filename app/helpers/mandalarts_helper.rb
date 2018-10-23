module MandalartsHelper
  def show_sub_elem(subNum)
    content_tag(:div, id: subNum, style: 'visibility: hidden;') do
      default_attributes = {type: 'sub'}
      core_attributes = default_attributes.merge({ style: 'visibility: hidden; border: 1px dotted #999;'})
      (1..9).each do |n|
        attributes = (n == 5) ? core_attributes : default_attributes
        concat content_tag(:input, ' ', { id: "#{subNum}-#{n}" }.merge(attributes))
      end
    end
  end

  def show_core_elem
    content_tag(:div, id: 'core') do
      get_attributes = lambda{|n| { id: "5-#{n}", type: 'core'}}
      (1..9).each do |n|
        attributes = get_attributes.call(n)
        attributes.merge!(onchange: "animeTest1(#{n}, this.value)") unless n == 5
        concat content_tag(:input, ' ', attributes)
      end
    end
  end
end
