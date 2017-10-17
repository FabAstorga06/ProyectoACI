quit -sim 

cd {C:\Users\Javier\Documents\Altera\ProcesadorJOF32\simulation\modelsim}

echo "Creating library"
vlib ./work
vmap work ./work

echo "Adding library"
vlib altera_mf_ver
vmap altera_mf_ver ./altera_mf_ver

echo "Compiling library"
vlog -work ./altera_mf_ver C:/intelFPGA_lite/16.1/quartus/eda/sim_lib/altera_mf.v

echo "Compiling modules"
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/procesadorJOF32_top.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/write_back.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/sumador1.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/sign_extend.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/registro_mem_wb.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/registro_if_id.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/registro_id_ex.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/registro_ex_mem.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/register_pc.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/register_memory.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/ram_1port.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/n_bit_comparator.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/n_bit_adder.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/muxwb.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/muxpc.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/muxexe.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/muxalu.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/mux_ld.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/memory.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/instruction_memory.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/fetch.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/execute.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/decode.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/data_memory.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/control.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/branch_control.v
vlog -work ./work C:/Users/Javier/Documents/Altera/ProcesadorJOF32/alu.v

echo "Load/Simulate the design"
vsim -L altera_mf_ver procesadorJOF32_top -t ns

#echo "Load waveforms"
#source wave.do

echo "Running simulation...."
run -all

echo "Done."
