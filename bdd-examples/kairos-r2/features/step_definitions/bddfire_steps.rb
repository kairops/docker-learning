require_relative '../../../../common/cucumber/bddfire_steps'

Given(/^I am on the home page of Kairos DS$/) do
    visit("https://www.kairosds.com")
end

Given(/^I accept the cookies message$/) do
    click_link("Estoy de acuerdo")
end

Then(/^I should see the cookies message$/) do
    page.should have_content("Utilizamos cookies para asegurar que damos la mejor experiencia al usuario en nuestro sitio web. Si continúa utilizando este sitio asumiremos que está de acuerdo")
end
  
Then(/^The cookies message dissapear$/) do
    page.should have_no_content("Utilizamos cookies para asegurar que damos la mejor experiencia al usuario en nuestro sitio web. Si continúa utilizando este sitio asumiremos que está de acuerdo")
end
  