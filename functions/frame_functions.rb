

def switch_to_frame_containing_element(find_by, element_to_find) 
  frames = $driver.find_elements(:xpath => "//*[contains(@id, 'PegaGadget')]")
  frames.each do |i|
    $driver.switch_to.default_content
    $driver.switch_to.frame(i)
    elements = $driver.find_elements(find_by => element_to_find)
    if elements.size > 0
      break
    end
  end
  return
end