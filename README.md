# This is the code of cross-Scene hyperspectral feature selection via hybrid whale optimization algorithm with simulated annealing
data preparation:
make DataCube.mat:
 - DataCube1: source scene DataCube
 - DataCube2: target scene DataCube
 - gt1: source scene ground-truth
 - gt2: target scene ground-truth

Run generateSamples.m to generate the training and test data of ten different experiments.

Run main.m to go through the CDWOASA feature selection.
