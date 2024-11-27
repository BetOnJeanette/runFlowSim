declare -n TEST_NAME = $1

verify-valid-proj(){
    $TEST_NAME = ${TEST_NAME// }
    if [ -z $TEST_NAME ]; then
        echo "No test name provided"
        exit 1
    fi
}

open_sim_dir(){
    dir="${FOAM_RUN}/${TEST_NAME}" 
    if [ ! -d "$dir" ]; then 
        echo "The provided test name does not exist in the FOAM_RUN dir"
        exit 1
    fi
    cd $dir
}

run_sim(){
    blockMesh
    foamRun
    foamToVTK
}

verify-valid-proj
open_sim_dir
run_sim
