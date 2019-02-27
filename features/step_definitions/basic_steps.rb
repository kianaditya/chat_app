Given("the following users exist") do |table|
    table.hashes.each do |user|
        create(:user, user)
    end
end
  
Given("I am logged in as {string}") do |email|
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
  
  Given("I log in as {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given("I visit the dashboard page") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given("I click {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given("I click {string} button for {string}") do |string, string2|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given("I fill in {string} in {string}") do |string, string2|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given("I switch to window {int}") do |int|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given("I wait {int} second") do |int|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Given("I click on the chat widget button") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I should see a message saying: {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("when I switch to window {int}") do |int|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I click on the chat widget button") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I should NOT see a message saying: {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I switch to window {int}") do |int|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("all windows are closed") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("the date is {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I log in as {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I visit the dashboard page") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I click {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I wait {int} second") do |int|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Then("I should see {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  