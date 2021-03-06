/**
 *  test_bp.v
 */

module test_bp
 import bp_common_pkg::*;
 import bp_be_rv64_pkg::*;
 import bp_be_pkg::*;
 import bp_be_dcache_pkg::*;
 import bp_cce_pkg::*;
 #(parameter vaddr_width_p                 = "inv"
   , parameter paddr_width_p               = "inv"
   , parameter asid_width_p                = "inv"
   , parameter branch_metadata_fwd_width_p = "inv"
   , parameter btb_indx_width_p            = "inv"
   , parameter bht_indx_width_p            = "inv"
   , parameter ras_addr_width_p            = "inv"
   , parameter core_els_p                  = "inv"
   , parameter num_cce_p                   = "inv"
   , parameter num_lce_p                   = "inv"
   , parameter lce_sets_p                  = "inv"
   , parameter lce_assoc_p                 = "inv"
   , parameter block_size_in_bytes_p       = "inv"
   , parameter num_inst_ram_els_p          = "inv"
   , parameter mem_els_p                   = "inv"

   // Trace replay parameters
   , parameter trace_ring_width_p          = "inv"
   , parameter trace_rom_addr_width_p      = "inv"

   // Test program related parameters
   , parameter boot_rom_els_p              = "inv"
   , parameter boot_rom_width_p            = "inv"
   );

logic clk, reset;

// clock gen
//
bsg_nonsynth_clock_gen 
 #(.cycle_time_p(`BSG_CORE_CLOCK_PERIOD))
 clk_gen 
  (.o(clk));

// reset gen
//
bsg_nonsynth_reset_gen 
 #(.num_clocks_p(1)
   ,.reset_cycles_lo_p(0)
   ,.reset_cycles_hi_p(4)
   ) 
 reset_gen 
  (.clk_i(clk)
   ,.async_reset_o(reset)
   );
 
testbench
 #(.vaddr_width_p(vaddr_width_p)
   ,.paddr_width_p(paddr_width_p)
   ,.asid_width_p(asid_width_p)
   ,.branch_metadata_fwd_width_p(branch_metadata_fwd_width_p)
   ,.btb_indx_width_p(btb_indx_width_p)
   ,.bht_indx_width_p(bht_indx_width_p)
   ,.ras_addr_width_p(ras_addr_width_p)
   ,.core_els_p(core_els_p)
   ,.num_lce_p(num_lce_p)
   ,.num_cce_p(num_cce_p)
   ,.lce_assoc_p(lce_assoc_p)
   ,.lce_sets_p(lce_sets_p)
   ,.block_size_in_bytes_p(block_size_in_bytes_p)
   ,.num_inst_ram_els_p(num_inst_ram_els_p)
   ,.mem_els_p(mem_els_p)
   ,.boot_rom_width_p(boot_rom_width_p)
   ,.boot_rom_els_p(boot_rom_els_p)

   ,.trace_ring_width_p(trace_ring_width_p)
   ,.trace_rom_addr_width_p(trace_rom_addr_width_p)
   )
 tb
  (.clk_i(clk)
   ,.reset_i(reset)
   );

endmodule

