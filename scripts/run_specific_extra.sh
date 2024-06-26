function="specific_functions"
A_TOTAL="575"

log_path="${function}_logs"

if [ ! -d "$log_path" ]; then
  mkdir -p "$log_path"
fi

for B in {0..5}; do
    UUID="job_$(uuidgen | cut -c 1-8)"
    log_name="${log_path}/logs_${UUID}.out"
    qsub -o ${log_name} -e ${log_name} -N ${UUID} -J 0-${A_TOTAL} -v B=$B,function=$function,noise=0.025 scripts/array_job.sh
    echo "Submitted array job of ${A_TOTAL} individual jobs, called ${UUID} with behaviour ${B}"
done
