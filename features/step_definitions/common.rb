##
## Common steps to be used my multiple test cases
##
require 'rspec'
require File.join(File.dirname(__FILE__), '../..', 'properties/options')

Given(/^We navigate to the prior authorization app$/) do
  $driver.navigate.to $ops[:url]
end

Given(/^We log in as a CST user$/) do
  title = $driver.title
  puts title
  if title == 'Access to this site is blocked' then
      $driver.switch_to.frame($driver.find_element(:name => "ws_blockoption"));
      $driver.find_element(:name => 'ws-continue').click
      wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
      begin
        title = wait.until { $driver.title }
      end
    end
  $driver.find_element(:id, 'txtUserID').send_keys($ops[:username])
  $driver.find_element(:id, 'txtPassword').send_keys($ops[:password])
  $driver.find_element(:id, 'sub').click
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
  begin
    title = wait.until { $driver.title }
    expect(title).to eq('Pega Case Manager Portal')
  ensure
    # do nothing
  end
end
