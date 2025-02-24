## Assign Switches to Inputs
set_property PACKAGE_PIN V17 [get_ports {inputs[0]}]  ; # SW0
set_property PACKAGE_PIN V16 [get_ports {inputs[1]}]  ; # SW1
set_property PACKAGE_PIN W16 [get_ports {inputs[2]}]  ; # SW2
set_property PACKAGE_PIN W17 [get_ports {inputs[3]}]  ; # SW3
set_property IOSTANDARD LVCMOS33 [get_ports {inputs[*]}]

## Assign 7-Segment Display Pins
set_property PACKAGE_PIN U2  [get_ports {seg_out[0]}]  ; # Segment A
set_property PACKAGE_PIN U4  [get_ports {seg_out[1]}]  ; # Segment B
set_property PACKAGE_PIN V4  [get_ports {seg_out[2]}]  ; # Segment C
set_property PACKAGE_PIN W4  [get_ports {seg_out[3]}]  ; # Segment D
set_property PACKAGE_PIN W3  [get_ports {seg_out[4]}]  ; # Segment E
set_property PACKAGE_PIN V2  [get_ports {seg_out[5]}]  ; # Segment F
set_property PACKAGE_PIN U3  [get_ports {seg_out[6]}]  ; # Segment G
set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[*]}]

## Assign Common Anode/Cathode Pins (If using a 7-segment display with multiple digits)
set_property PACKAGE_PIN U1  [get_ports {anodes[0]}]  ; # Anode 1
set_property PACKAGE_PIN V1  [get_ports {anodes[1]}]  ; # Anode 2
set_property PACKAGE_PIN W1  [get_ports {anodes[2]}]  ; # Anode 3
set_property PACKAGE_PIN Y2  [get_ports {anodes[3]}]  ; # Anode 4
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[*]}]

## Assign Clock Pin (If needed for multiplexing)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
