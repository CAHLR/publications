**Warning**: This code is not intended as a toolbox for performing analysis.  It is meant to accompany work published in EDM 2015.  This is research code, uploaded with minimal documentation and warts included


**HOW TO USE**:

In order to be used for analysis, data must be reformatted into a simple csv file with the following format:

**Student #, KC #, KC subpart #, KC subsubpart #, Correctness, timeSinceLastAction, timeSpent**

All fields MUST be integer valued, and the header row should be excluded.  Fields are explained below:

Student #: Number representing a particular user

KC #: Integer representing a particular KC.  For the paper, this means a problem

KC subpart #: Integer representing the identity of a subpart within a KC (just include 1 if not available)

KC subsubpart #: Integer representing the identity of a subsubpart within a KC.  Currently Unused (include 1 if not available)

Correctness: field indicating observation correctness. 1: incorrect, 2: correct, 0:video observation without associated correctness

timeSinceLastAction: Currently unused, must be integer

timeSpent:Currently unused, must be integer

**Running the Code**:
In order to run the code with data in the format described above, edit the analysis/parseAllData.m matlab script

Change line 7 to indicate the location of your file

Then, run the parseAllData script

After running, a number of results objects will have been generated, for the 'Template-Videos', 'StandardBKT', and 'Template-1-video' Conditions.  These are, respectively, withResourceResults, noResourceResults, and oneResourceResults, which include information about RMSE and model details
