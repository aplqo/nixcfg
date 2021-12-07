{ profile }:
{ config, pkgs, lib, ...}:
{
  programs.htop = {
    enable = true;
    settings = {
      fields = with config.lib.htop.fields; [
        PID
        USER 
        PRIORITY 
        NICE 
        M_SIZE 
        M_RESIDENT 
        M_SHARE 
        STATE 
        PERCENT_CPU
        PERCENT_MEM
        TIME
        COMM
      ];
      hide_kernel_threads = true;
      hide_userland_threads = true;
      show_thread_names = true;
      show_program_path = false;
      tree_view = true;
      detailed_cpu_time = true;
      show_cpu_frequency = true;
      show_cpu_temperature = profile != "server";
    } // (with config.lib.htop; leftMeters ([
      (bar "AllCPUs") 
      (bar "Memory") 
      (bar "Swap")
    ] ++ (if profile == "laptop" then [ (bar "Battery") ] else [])))
    // (with config.lib.htop; rightMeters [
      (text "Tasks") 
      (text "LoadAverage") 
      (text "Uptime") 
      (text "DiskIO") 
      (text "NetworkIO") 
      (text "Systemd")
    ]);
  };
}
