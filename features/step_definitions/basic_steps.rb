Given("the following users exist") do |table|
    table.hashes.each do |user|
        create(:user, user)
    end
end
  
Given("I( am) logged/log in as {string}") do |email|
    user = User.find_by(email: email)
    login_as(user, scope: :user)
end
  
Given("I visit the site") do
    visit root_path
end
  
Given("I open a new window") do
    window = open_new_window
    switch_to_window(window)
end

Given("I click on {string}") do |element|
    click_on element
end
  
Given("I fill in {string} in {string}") do |value, element|
    fill_in element, with: value
end
  
Given("I switch to window {int}") do |index|
    switch_to_window(windows[index - 1])
end
  
Given("I wait {int} second") do |seconds|
    sleep seconds
end

  