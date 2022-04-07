function data = importSelectingData(filename, dataLines)
%IMPORTFILE Import data from a text file
%  DATA = IMPORTFILE(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a table.
%
%  DATA = IMPORTFILE(FILE, DATALINES) reads data for the specified row
%  interval(s) of text file FILENAME. Specify DATALINES as a positive
%  scalar integer or a N-by-2 array of positive scalar integers for
%  dis-contiguous row intervals.
%
%  Example:
%  data = importfile("C:\Users\barmstro\MATLAB Drive\Courses\Practical Data Science with MATLAB\Course 1\Lesson 1\StormEvents_2013.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 28-Apr-2019 12:33:48
%
% Modified to remove variables to reduce scrolling during screen recording

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 23);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "State", "Var4", "Month", "Event_Type", "Begin_Date_Time", "Timezone", "End_Date_Time", "Injuries_Direct", "Injuries_Indirect", "Deaths_Direct", "Deaths_Indirect", "Var14", "Property_Cost", "Var16", "Crop_Cost", "Begin_Lat", "Begin_Lon", "End_Lat", "End_Lon", "Episode_Narrative", "Event_Narrative"];
opts.SelectedVariableNames = ["State", "Month", "Event_Type", "Begin_Date_Time", "Timezone", "Property_Cost", "Crop_Cost", "Begin_Lat", "Begin_Lon", "End_Lat", "End_Lon", "Episode_Narrative", "Event_Narrative"];
opts.VariableTypes = ["string", "string", "categorical", "string", "categorical", "categorical", "datetime", "categorical", "datetime", "double", "double", "double", "double", "string", "double", "string", "double", "double", "double", "double", "double", "categorical", "string"];
opts = setvaropts(opts, 7, "InputFormat", "yyyy-MM-dd HH:mm:ss");
opts = setvaropts(opts, 9, "InputFormat", "yyyy-MM-dd HH:mm");
opts = setvaropts(opts, [1, 2, 4, 14, 16, 23], "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 2, 3, 4, 5, 6, 8, 14, 16, 22, 23], "EmptyFieldRule", "auto");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
data = readtable(filename, opts);

end