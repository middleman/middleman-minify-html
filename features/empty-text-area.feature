Feature: Keep Empty Text Area's
  
  Scenario: Preview HTML with minify_html enabled
    Given "minify_html" feature is "enabled"
    And the Server is running at "basic-app"
    When I go to "/empty-text-area.html"
    Then I should see "<textarea></textarea>"

  Scenario: Build HTML with minify_html enabled
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      activate :minify_html
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "empty-text-area.html" should contain "<textarea></textarea>"