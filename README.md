# What is this repo
This is a small shell script made for a friend to "quickly" run openflow simulations and zip its results to an easy to access location.

# How do I use it?
1. Prep a sim in a subdirectory of $FOAM_RUN
2. Run this script with the name of the subdirectory as a positional argument. For example, if the sim to be run is in $FOAM_RUN/pitzDailySteady, run `bash flowSimAuto.sh pitzDailySteady`
3. Wait for the simulation to complete
After it completes, the VTK files will be put in a zip file in ~/testResults, with the file name being the same as the subdirectory name.
