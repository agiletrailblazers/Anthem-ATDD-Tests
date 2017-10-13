require 'selenium-webdriver'
require 'rspec'
require File.join(File.dirname(__FILE__), '../..', 'properties/options')
require File.join(File.dirname(__FILE__), '../..', 'functions/frame_functions')
$driver
$callerType

Before do |feature|
  $driver = Selenium::WebDriver.for :firefox
end

And(/^We navigate to the caller reason page$/) do
  $driver.find_element(:xpath => "//*[@role='menu']").click
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # second
  begin
    element = wait.until { $driver.find_element(:class => "menu-panel-wrapper") }
    element.click
  end
  begin
    sleep 3  #this is not ideal - find a way to refactor so we 'wait' for the frame to reload
    switch_to_frame_containing_element(:id, 'CallerType')
    expect($driver.find_elements(:id => "CallerType")).not_to be_empty
  ensure
    # nothing
  end
end

When(/^We submit the caller reason form$/) do
   $driver.find_element(:xpath, "//*[@title='Complete this assignment']").click
end

Given(/^We enter a caller type (.*)$/) do |callerType|
  $driver.find_element(:id, 'CallerType').send_keys(callerType)
  $callerType = callerType
end

Given(/^We enter a reason (.*)$/) do |reason|
  $driver.find_element(:id, 'CallReason').send_keys(reason)
end

Given(/^We enter a first name (.*)$/) do |firstName|
  $driver.find_element(:id, 'Firstname').send_keys(firstName)
end

Given(/^We enter a last name (.*)$/) do |lastName|
  $driver.find_element(:id, 'LastName').send_keys(lastName)
end

Given(/^We enter a phone (.*)$/) do |phone|
  $driver.find_element(:id, 'Phone').send_keys(phone)
end

Then(/^The caller reason form verification page will be displayed$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
  begin
     element = wait.until { $driver.find_element(:xpath => "//label[@for='CallerType']/following-sibling::div") }
     expect(element.text).to eq($callerType)
  ensure
    #do nothing
  end
end

Then(/^An error will be displayed$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
  begin
    alert = wait.until { $driver.switch_to.alert }
    expect(alert.text).to eq('Please correct flagged fields before submitting the form!')
  ensure
    alert.accept
  end
end

Then(/^The caller reason form success message will be displayed$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
  begin
     element = wait.until { $driver.find_element(:xpath => "//div[text()='Thank you for your input.']") }
     expect(element.text).to eq('Thank you for your input.')
  ensure
    #do nothing
  end
end

After do |feature|
  $driver.quit
end
