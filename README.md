# README

## Getting started
* Clone this repo
* Check out a branch for your tech test
* Run `bin/setup`
* You can run the exisiting tests with `bin/rspec`

## Instructions
This is a simple app with two models `Lawyer` and `Company`.
There's an endpoint for viewing all the lawyers in the system `/lawyers`, an
endpoint for viewing all the companies in the system `/companies`, and an
endpoint for viewing an individual company `/companies/:id`

The company show page `/companies/:id` has a link to manage lawyers for a
company.
This link doesn't go anywhere.
The tech test is to add the functionality to associate lawyers with a company.

## Mock up of the required UI

![example.png](https://github.com/lawbite/tech-test/raw/main/public/example.png)

## Feature requirements

### Associating a lawyer with a company
* Given there is a lawyer with the name "Lawyer 1"
* And I'm on the company show page for "Company 1"
* And I click "Manage Lawyers"
* And I check the check box next to "Lawyer 1"
* When I click "Save"
* Then I should be redirected to the company show page for "Company 1"
* And I should see "Lawyer 1" in the list of company lawyers

### Removing a lawyer from a company
* Given there is a lawyer with the name "Lawyer 1"
* And "Lawyer 1" is associated with "Company 1"
* And I'm on the company show page for "Company 1"
* And I click "Manage Lawyers"
* And I uncheck the check box next to "Lawyer 1"
* When I click "Save"
* Then I should be redirected to the company show page for "Company 1"
* And I should not see "Lawyer 1" in the list of company lawyers

### Lawyers can't be associated with more than one company
* Given there is a lawyer with the name "Lawyer 1"
* And "Lawyer 1" is associated with "Company 1"
* And there is a lawyer with the name "Lawyer 2"
* And I'm on the company show page for "Company 2"
* When I click "Manage Lawyers"
* Then I should not see the option to select "Lawyer 1"

### Companies have a maximum of two lawyers
* Given there is a lawyer with the name "Lawyer 1"
* And there is a lawyer with the name "Lawyer 2"
* And there is a lawyer with the name "Lawyer 3"
* And "Lawyer 1" is associated with "Company 1"
* And "Lawyer 2" is associated with "Company 1"
* And I'm on the company show page for "Company 1"
* And I click "Manage Lawyers"
* And I check the check box next to "Lawyer 3"
* When I click "Save"
* Then I should see the validation error "Maximum number of lawyers reached"

### Associating a new lawyer with a company sends an email
* Given there is a lawyer with the name "Lawyer 1"
* And I'm on the company show page for "Company 1"
* And I click "Manage Lawyers"
* And I check the check box next to "Lawyer 1"
* When I click "Save"
* Then "Lawyer 1" should receive an email that they've been added to a new
  company  
NOTE If the lawyer is already on the team they should not receive an email
when the form is saved.  
NOTE you don't need to write the full mailer, just a stub object that prints a
message to the console is fine.

### Editing the company name
* Given I'm on the company page for "Company 1"
* When I click the title "Company 1"
* Then I should see a form to update the company name
* And I should not see any lawyer names

## Tips
* Styling / layout is unimportant for this tech test.
* TDD
* Tackle one feature at a time. It's better to have one fully working feature
  than all the features partially complete.
* Write good commit messages / have a good git history
* **No call backs**
* Keep logic out of controllers
* Think about resources (Rails resources, not performance)
* The app should support removing a lawyer from one company and assigning them
  to another company
