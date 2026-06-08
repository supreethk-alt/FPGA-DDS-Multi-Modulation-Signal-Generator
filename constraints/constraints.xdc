############################
## CLOCK (50 MHz onboard)
############################
set_property PACKAGE_PIN H11 [get_ports clk_in1_0]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in1_0]
create_clock -period 20.000 [get_ports clk_in1_0]

############################
## RESET BUTTON
############################

#set_property PACKAGE_PIN J12 [get_ports reset_0]
#set_property IOSTANDARD LVCMOS33 [get_ports reset_0]

############################
## SWITCH INPUTS (sel)
############################
# sel[0]
set_property PACKAGE_PIN M11 [get_ports {sel_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sel_0[0]}]

# sel[1]
set_property PACKAGE_PIN K11 [get_ports {sel_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sel_0[1]}]

############################
## SPI DAC CONNECTION
############################
set_property PACKAGE_PIN F1 [get_ports SCK_0]
set_property IOSTANDARD LVCMOS33 [get_ports SCK_0]

set_property PACKAGE_PIN D2 [get_ports CS_0]
set_property IOSTANDARD LVCMOS33 [get_ports CS_0]

set_property PACKAGE_PIN E2 [get_ports MOSI_0]
set_property IOSTANDARD LVCMOS33 [get_ports MOSI_0]