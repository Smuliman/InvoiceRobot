*** Settings ***
Documentation       Check if new invoice for software service is valid or if it needs human check

Library             RPA.Browser.Selenium    auto_close=${FALSE}
Library             RPA.PDF
Library             RPA.FileSystem
Library             OperatingSystem
Library             String
Library             RPA.Outlook.Application
Library             search.py
Library             RPA.Excel.Files
Library             RPA.Excel.Application


*** Variables ***
${INVOICE_STATUS}       True
${DOWNLOAD_URL}         C:/Users/Samuli/Downloads/102022.pdf
${EXPECTED_INVOICE}     ${334.80}


*** Tasks ***
Check if new invoice for software service is valid or if it needs human check
    Open the intranet webpage
    Click download pdf
    Download pdf
    Sleep    5s
    Extract text from pdf file to text file    ${DOWNLOAD_URL}
    ${check}=    Check if amount is expected


*** Keywords ***
Open the intranet webpage
    Open Available Browser    https://github.com/Smuliman/InvoiceRobot/blob/master/demolaskut/

Click download pdf
    Click Element When Visible    partial link:202

Download pdf
    Click Element When Visible    link:Download

Extract text from pdf file to text file
    [Arguments]    ${pdf_file_name}
    ${text}=    Get Text From Pdf    ${pdf_file_name}
    OperatingSystem.Create File    ${OUTPUT_DIR}${/}new_file.txt
    FOR    ${page}    IN    @{text.keys()}
        Append To File
        ...    ${OUTPUT_DIR}${/}new_file.txt
        ...    ${text[${page}]}
    END

Check if amount is expected
    ${check}=    Search Str    ./output/new_file.txt    tilinro334,80

    IF    ${check} == True
        RPA.Excel.Files.Open Workbook    InvoiceData.xlsx
        RPA.Excel.Files.Set Worksheet Value    10    2    ${EXPECTED_INVOICE}
        RPA.Excel.Files.Set Worksheet Value    10    3    +
        RPA.Excel.Files.Set Worksheet Value    10    4    -

        Save Workbook

        Close Workbook
    ELSE
        Log    Vaatii ihmistarkistuksen
    END
