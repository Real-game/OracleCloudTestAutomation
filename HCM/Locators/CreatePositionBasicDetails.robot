*** Variables ***

${bu_unit}  xpath://input[@title="Metrolinx BU"]
${effective_start_date}  xpath://label[text()='Effective Start Date']/following::input[1]
${business_unit}  xpath://label[text()='Business Unit']/following::input[1]
${position_name}  xpath://label[text()='Name']/following::input[1]
${position_code}  xpath://label[text()='Code']/following::input[1]
#${business_unit}  xpath://input[@id="_FOpt1:_FOr1:0:_FONSr2:0:MAnt2:1:AP4:BUNameId::content"]
#${position_name}  xpath://input[@id="_FOpt1:_FOr1:0:_FONSr2:0:MAnt2:1:AP4:inputText2::content"]
#${position_code}  xpath://input[@id="_FOpt1:_FOr1:0:_FONSr2:0:MAnt2:1:AP4:inputText4::content"]
${next}  link:Next

${next_button}  xpath://div[@title="Next"]