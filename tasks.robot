*** Settings ***
Documentation       Check if new invoice for software service is valid or if it needs human check

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             RPA.PDF
Library             RPA.FileSystem


*** Tasks ***
Check if new invoice for software service is valid or if it needs human check
    Open the intranet webpage
    Click download pdf
    Download pdf
    Extract text from pdf file to text file    C:/Users/Samuli/Downloads/102022.pdf


*** Keywords ***
Open the intranet webpage
    Open Available Browser    https://github.com/Smuliman/InvoiceRobot/blob/master/demolaskut/

Click download pdf
    Click Element When Visible    partial link:202

Download pdf
    Click Element When Visible    link:Download

Open my pdf
    Open Pdf    C:/Users/Samuli/Downloads/102022.pdf

Extract text from pdf file to text file
    [Arguments]    ${pdf_file_name}
    ${text}=    Get Text From Pdf    ${pdf_file_name}
    Create File    ${OUTPUT_DIR}${/}new_file.txt
    FOR    ${page}    IN    @{text.keys()}
        Append To File
        ...    ${OUTPUT_DIR}${/}new_file.txt
        ...    ${text[${page}]}
    END
