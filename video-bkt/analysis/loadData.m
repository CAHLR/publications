function  [withResourceFormattedData, noResourceFormattedData, oneResourceFormattedData, exercises] = loadData(filename, threshold, subpartThreshold)
    disp('Loading data...')
    allData = load(filename);
    fprintf('Filtering for exercises with more than %d events...\n', threshold);
    [exercises, perExerciseTraces] = getTracesAboveThreshold(allData, threshold);
    disp('Reformatting Data');
%     perExerciseTraces = perExerciseTraces(2:end); %ignore uncategorized resources (id 0)
%     exercises = exercises(2:end);
    [withResourceFormattedData, exercises, perExerciseTraces] = parsing.formatAndFilterExerciseData(...
        perExerciseTraces, @parsing.translateRawExerciseWithResource, exercises, subpartThreshold);
    hasVideoIdx = cellfun(@(x)max(x.resources), withResourceFormattedData) > 1;
    withResourceFormattedData = withResourceFormattedData(hasVideoIdx);
    exercises = exercises(hasVideoIdx);
    perExerciseTraces = perExerciseTraces(hasVideoIdx);
    oneResourceFormattedData = parsing.formatAndFilterExerciseData(...
        perExerciseTraces, @parsing.translateRawExerciseWithOneResource, exercises, subpartThreshold);
    noResourceFormattedData = parsing.formatAndFilterExerciseData(...
        perExerciseTraces, @parsing.translateRawExerciseNoResourceWithSubparts, exercises, subpartThreshold);
    
        
    %do some awkward manipulation to add some diagnostic info about
    %resource counts to no-resource data
    %excuse the sloppy iterative loop
    
    for i=1:length(withResourceFormattedData)
        %go ahead and add it to the withResource data just to simplify
        %later analysis
        withResourceFormattedData{i}.resourceCounts = parsing.getResourceCounts(withResourceFormattedData{i});
        noResourceFormattedData{i}.resourceCounts = removeAllResourceTraceCounts(withResourceFormattedData{i});
        oneResourceFormattedData{i}.resourceCounts = withResourceFormattedData{i}.resourceCounts;
    end
end

function filteredResourceCounts = removeAllResourceTraceCounts(data) 
    %obviously, don't include data about traces that only involved
    %resources for models not using them
    filteredResourceCounts = data.resourceCounts(data.resourceCounts ~= data.lengths);
end
% [oneResourceFormattedData, exercises] = formatExerciseData(perExerciseTraces, @translateRawExerciseWithOneResource, exercises, subpartThreshold);
% [one.err, one.accuracy, one.testAccFull, one.trainAccFull, one.testErrFull, one.trainErrFull] = partitionTrainAndTest(oneResourceFormattedData, 5);
% oneModels = trainModels(oneResourceFormattedData, 25);
