***Settings***
Resource  ResourceSearchTest.robot

*** Test Cases ***
Test Case 01: Run a Google Search
  Open the Browser
  Run a search for "robot framework"
  Check if search returned results
  Click the third result and check if the correct page loads
  Close the Browser
