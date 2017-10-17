transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/ram_1port.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/write_back.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/sumador1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/sign_extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/registro_mem_wb.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/registro_if_id.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/registro_id_ex.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/registro_ex_mem.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/register_pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/register_memory.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/procesadorJOF32_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/n_bit_comparator.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/muxwb.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/muxpc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/muxexe.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/muxalu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/mux_ld.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/memory.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/fetch.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/execute.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/decode.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/data_memory.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/branch_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Javier/Documents/Altera/ProcesadorJOF32 {C:/Users/Javier/Documents/Altera/ProcesadorJOF32/instruction_memory.v}

