view wave 
wave clipboard store
wave create -pattern none -portmode input -language vlog /procesadorJOF32_top/clk 
wave create -pattern none -portmode output -language vlog -range 31 0 /procesadorJOF32_top/reg16 
wave modify -driver freeze -pattern clock -initialvalue (no value) -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns Edit:/procesadorJOF32_top/clk 
WaveCollapseAll -1
wave clipboard restore
