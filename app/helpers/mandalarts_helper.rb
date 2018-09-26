module MandalartsHelper
  def put_sub_elem
    html_text = ''
    (1..9).each do |n|
      if n == 5 
        elem = '<input id="1-' +  n.to_s + '" type="text" class="col-xl-3" style="visibility: hidden;" />'
      else
        elem = '<input id="1-' +  n.to_s + '" type="text" class="col-xl-3" />'
      end
      html_text += elem
    end
    return html_text
  end
end
