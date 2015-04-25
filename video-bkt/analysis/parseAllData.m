%%setup and config
%number of events required to consider an exercise
threshold = 500;
%required amount of data for each subpart of an exercise
subpartThreshold = 10;
%file to load
filename = 'path/to/data'
%number of folds for cross validation
folds = 5;
%actually load and format the data
[withResourceFormattedData, noResourceFormattedData, oneResourceFormattedData, exerciseReference] = loadData(filename, threshold, subpartThreshold);



%% training and testing
disp('Training models with resources');
withResourceResults = partitionTrainAndTest(withResourceFormattedData, folds);
disp('*********Training models without resources********');
noResourceResults = partitionTrainAndTest(noResourceFormattedData, folds);
% disp('*********Training models with single resources******');
oneResourceResults = partitionTrainAndTest(oneResourceFormattedData, folds);


calculateAnalysisResults;
