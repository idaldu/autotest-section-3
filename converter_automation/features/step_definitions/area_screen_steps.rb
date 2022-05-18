Given(/^I click on Got it button$/) do
  find_element(:id, "android:id/button1").click
end

Given(/^I land on "([^"]*)" screen$/) do |header|
  header_form = find_element(:class, "android.widget.TextView").text
  if header_form != header
    fail("Expected header is #{header}, but actual header #{header_form}")
  end
end

Given(/^I land on "([^"]*)" popup$/) do |header|
  header_popup = find_element(:id, "com.physphil.android.unitconverterultimate:id/alertTitle").text
  if header_popup != header
    fail("Expected header is #{header}, but actual header #{header_popup}")
  end
end

When(/^I click on Swap button$/) do
  find_element(:id, "com.physphil.android.unitconverterultimate:id/fab").click
end

And(/^I see "([^"]*)" in From header$/) do |value|
  actual_value = find_element(:id, "com.physphil.android.unitconverterultimate:id/header_text_unit_from").text
  if actual_value != value
    fail("Expected values is #{value}, but actual value #{actual_value}")
  end
end

And(/^I see "([^"]*)" in To header$/) do |value|
  actual_value = find_element(:id, "com.physphil.android.unitconverterultimate:id/header_text_unit_to").text
  if actual_value != value
    fail("Expected values is #{value}, but actual value #{actual_value}")
  end
end

And(/^I click on Clear button$/) do
  find_element(:id, "com.physphil.android.unitconverterultimate:id/menu_clear").click
end

When(/^I enter "([^"]*)" to from field$/) do |value|
  find_element(:id, "com.physphil.android.unitconverterultimate:id/header_value_from").send_keys(value)
end

Then(/^I get "([^"]*)" in To field$/) do |value|
  actual_value = find_element(:id, "com.physphil.android.unitconverterultimate:id/header_value_to").text
  if actual_value != value
    fail("Expected value is #{value}, but actual value #{actual_value}")
  end
  end

When(/^I click on From field$/) do
  find_element(:id, "com.physphil.android.unitconverterultimate:id/header_value_from").click
  end

And(/^I press "([^"]*)" on soft keyboard$/) do |value|
  digit = value.split("")
  digit.each do |key|
    digit = Integer(key)
    press_keycode 7 + digit
  end
end

When(/^I select "([^"]*)" from left column$/) do |value|
  group = find_element(:id, "com.physphil.android.unitconverterultimate:id/radio_group_from")
  group.find_element(:xpath, "//android.widget.RadioButton[@text='#{value}']").click
end