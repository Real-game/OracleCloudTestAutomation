*** Variables ***

${my_benefits}  xpath: //span[text()='Your Benefits']
${metrolinx_benefit_program}  xpath: //span[text()='Metrolinx Benefit Program']
${dental_cover}  xpath: (//span[text()="Dental"])[1]/following::div[5]
${dental_price}  xpath: //span[text()='Dental']//following::table[contains(@id,'0:BenSPce:PltpGLv:0:BnSmPse:PrtRPgl')]
${basic_life_covered}  xpath: //span[text()='Basic Life']//following::span[contains(@id,'1:BenSPce:PltpGLv:0:BnSmPse:DpRPgl')]
${basic_life_price}  xpath: //span[text()='Basic Life']//following::table[contains(@id,'1:BenSPce:PltpGLv:0:BnSmPse:PrtRPgl')]


