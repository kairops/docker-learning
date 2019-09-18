require_relative '../../../../common/cucumber/bddfire_steps'

When(/^I press intro key with my little finger$/) do
    find(:xpath, "/html/body/div[1]/header/div/div[2]/div[2]/div/div/div/form/label/input[1]").native.send_keys(:return)
end
