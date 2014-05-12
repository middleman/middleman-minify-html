Feature: Minify HTML
  
  Scenario: Preview HTML with minify_html disabled
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      """
    And the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "13" lines
    
  Scenario: Preview HTML with minify_html enabled
    Given the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "1" lines
    When I go to "/foobar.php"
    Then I should see:
    """
    <?php
    echo "foo";
    // a comment
    echo "bar";
    ?>
    """

  Scenario: Preview HTML with minify_html enabled and custom option
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      activate :minify_html, :preserve_line_breaks => true
      """
    And the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "13" lines
  
  Scenario: Build HTML with minify_html disabled
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should contain "    <h1>"
  
  Scenario: Build HTML with minify_html enabled
    Given a fixture app "basic-app"
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should contain " <h1> Multi Line </h1> <h2> Broken Up </h2> "
    Then the file "foobar.php" should contain:
    """
    <?php
    echo "foo";
    // a comment
    echo "bar";
    ?>
    """