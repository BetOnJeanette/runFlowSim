#!/usr/bin/env bash
declare -n TEST_NAME = $1
STARTING_DIR=$pwd

verify_valid_proj(){
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
    touch "$TEST_NAME".foam
}

zip_results(){
    OUT_DIR="~/testResults"
    if [ ! -d "$OUT_DIR" ]; then
        mkdir "$OUT_DIR"
    fi
    zip -r "${OUT_DIR}/${TEST_NAME}.zip" .
}

verify_valid_proj
open_sim_dir
run_sim
zip_results
cd $STARTING_DIR

