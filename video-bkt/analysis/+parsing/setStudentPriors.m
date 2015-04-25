function [ newDataCollection ] = setStudentPriors( dataCollection )
%setStudentPriors Look at the first response and set the student's prior
%based on that response
	newDataCollection = cell(size(dataCollection));
    for i = 1:length(dataCollection)
        data = dataCollection{i};
        if mod(i, 10) == 0
            fprintf('Setting prior data for model %d\n', i);
        end
        newStarts = zeros(size(data.starts));
        newLengths = data.lengths + 1;
        %do this in an awful iterative loop b/c i'm not going for elegance here
        idx = 1;
        student = 1;
        %One new column for each student
        newData = zeros(size(data.data,1), size(data.data, 2) + length(data.starts));
        newRsc = zeros(1, length(data.resources) + length(data.starts));
        highPriorRsc = max(data.resources) + 1;
        lowPriorRsc = highPriorRsc + 1;
        while student <= length(data.starts)
            newStarts(student) = idx;
            newData(idx) = 0;
            studentData = data.data(:, data.starts(student):data.starts(student)+data.lengths(student)-1);
            studentRsc = data.resources(data.starts(student):data.starts(student)+data.lengths(student)-1);
            if firstResponseCorrect(studentData)
                newRsc(idx) = highPriorRsc;
            else
                newRsc(idx) = lowPriorRsc;
            end
            idx = idx + 1;
            newData(:, idx:idx+data.lengths(student)-1) = studentData;
            newRsc(idx:idx+data.lengths(student)-1) = studentRsc;
            idx = idx + data.lengths(student);
            %advance to next student
            student = student + 1;
        end

        %construct data object
        newDataObject.data = int8(newData);
        newDataObject.starts = int32(newStarts);
        newDataObject.lengths = int32(newLengths);
        newDataObject.resources = int16(newRsc);
        newDataCollection{i} = newDataObject;
    end
end

function isCorrect = firstResponseCorrect(studentData)
    rowData = sum(studentData, 1);
    isCorrect = false;
    for i=1:length(isCorrect)
        if rowData(i) == 1
            return;
        end
        if rowData(i) == 2
            isCorrect = true;
            return;
        end
    end
            
end

