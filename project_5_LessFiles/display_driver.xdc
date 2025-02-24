## Assign 7-Segment Display Segment Pins
set_property PACKAGE_PIN U2  [get_ports seg[0]]   
set_property PACKAGE_PIN U4  [get_ports seg[1]]   
set_property PACKAGE_PIN V4  [get_ports seg[2]]   
set_property PACKAGE_PIN W4  [get_ports seg[3]]   
set_property PACKAGE_PIN W3  [get_ports seg[4]]   
set_property PACKAGE_PIN V2  [get_ports seg[5]]   
set_property PACKAGE_PIN U3  [get_ports seg[6]]   
set_property IOSTANDARD LVCMOS33 [get_ports seg[*]]

## Assign 7-Segment Display Anodes (Multiplexed Display)
set_property PACKAGE_PIN U1  [get_ports an[0]]   
set_property PACKAGE_PIN V1  [get_ports an[1]]   
set_property PACKAGE_PIN W1  [get_ports an[2]]   
set_property PACKAGE_PIN Y2  [get_ports an[3]]   
set_property IOSTANDARD LVCMOS33 [get_ports an[*]]

## Assign Clock Pin (For Multiplexing)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Assign Control Signals for MUX (2-bit Control for 4 states)
set_property PACKAGE_PIN V16 [get_ports {control[0]}]   
set_property PACKAGE_PIN W16 [get_ports {control[1]}]   
set_property IOSTANDARD LVCMOS33 [get_ports {control[*]}]
