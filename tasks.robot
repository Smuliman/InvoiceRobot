*** Settings ***
Documentation       Check if new invoice for software service is valid or if it needs human check

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             RPA.PDF


*** Tasks ***
Check if new invoice for software service is valid or if it needs human check
    Open the intranet webpage
    Click download pdf


*** Keywords ***
Open the intranet webpage
    Open Available Browser    https://github.com/Smuliman/InvoiceRobot/blob/master/demolaskut/

Click download pdf
    Click Element When Visible    class:.pdf
