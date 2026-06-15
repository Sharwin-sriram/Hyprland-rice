temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
printf '{"text": "%d"}\n' "$temp"