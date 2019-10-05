# Screenshot prefix
screenshotNumber = 0
screenshotPrefix = "reports/screenshot_" + Time.now().strftime("%Y%m%d%H%M%S")


Before do
  ## setup code
end

After do
  ## teardown code
end

AfterStep() do
  if $config['take_screenshots']
    sleep $config['screenshot_delay']
    screenshotNumber += 1

    # Resize (only for Poltergeist)
    if Capybara.current_driver == :poltergeist
      height=page.evaluate_script("document.body.offsetHeight;")
      page.driver.browser.resize($config['browser_width'],height)
    end
    page.save_screenshot("#{screenshotPrefix}_#{screenshotNumber}.png")
  end
end
