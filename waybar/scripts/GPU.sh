gpu_fan=$(sensors lenovo_wmi_other-virtual-0 | awk '/fan2/ {print $2}')
printf '{"text": "%d"}\n' "$gpu_fan"