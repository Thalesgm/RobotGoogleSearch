***Settings***
Resource  ResourceSearchTest.robot

*** Test Cases ***
Test Case 01: Run a Google Search
  Open the Browser
  Run a search for "Robot Framework"
  Check if search returned results
  Click the third result
  Check if the correct page loads
  Close the Browser
