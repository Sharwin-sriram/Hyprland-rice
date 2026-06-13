cpu_fan=$(sensors lenovo_wmi_other-virtual-0 | awk '/fan1/ {print $2}')
printf '{"text": "%d"}\n' "$cpu_fan"