Feature: Capture Caller Reason
Scenario:
  Given We navigate to the prior authorization app
  And We log in as a CST user
  And We navigate to the caller reason page
  When We submit the caller reason form
  Then An error will be displayed

Scenario Outline:
  Given We navigate to the prior authorization app
  And We log in as a CST user
  And We navigate to the caller reason page
  And We enter a caller type <callerType>
  And We enter a reason <reason>
  And We enter a first name <firstName>
  And We enter a last name <lastName>
  And We enter a phone <phone>
  When We submit the caller reason form
  Then The caller reason form verification page will be displayed
  When We submit the caller reason form
  Then The caller reason form success message will be displayed
Examples:
  | callerType | reason | firstName | lastName | phone |
  | Office Staff | New PA | Tony | Hawk | 5555551212 |
  | Pharmacy | Benefit Inquiry | Tony | Hawk | 5555551212 |
