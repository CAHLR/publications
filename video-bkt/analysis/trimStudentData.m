function [ trimmedDataCollection ] = trimStudentData( dataCollection )
    trimmedDataCollection = cell(size(dataCollection));
    for i = 1:length(dataCollection)
        data = dataCollection{i};
        if mod(i, 10) == 0
            fprintf('Trimming data for model %d\n', i);
        end
        trimmedStarts = zeros(size(data.starts));
        trimmedLengths = zeros(size(data.lengths));
        %do this in an awful iterative loop b/c i'm not going for elegance here
        idx = 1;
        student = 1;
        container = zeros(size(data.data));
        rscContainer = zeros(size(data.resources));

        responsesFound = 0;
        while student <= length(data.starts)
            originalIdx = data.starts(student);
            trimmedStarts(student) = idx;
            while responsesFound < 1 && originalIdx < data.starts(student) + data.lengths(student)
                column = data.data(:, originalIdx);
                if sum(column) > 0
                    responsesFound = responsesFound + 1;
                end
                container(:, idx) = column;
                rscContainer(idx) = data.resources(originalIdx);
                idx = idx + 1;
                

                %increment counters
                originalIdx = originalIdx + 1;
            end
            trimmedLengths(student) = idx - trimmedStarts(student);
            %advance to next student
            student = student + 1;
            responsesFound = 0;
        end
        %now idx = end of trimmeddata + 1
        idx = idx - 1;
        trimmedData = container(:, 1:idx);
        trimmedRsc = rscContainer(:, 1:idx);

        %construct data object
        trimmedDataObject.data = int8(trimmedData);
        trimmedDataObject.starts = int32(trimmedStarts);
        trimmedDataObject.lengths = int32(trimmedLengths);
        trimmedDataObject.resources = int16(trimmedRsc);
        trimmedDataCollection{i} = trimmedDataObject;
    end
end

