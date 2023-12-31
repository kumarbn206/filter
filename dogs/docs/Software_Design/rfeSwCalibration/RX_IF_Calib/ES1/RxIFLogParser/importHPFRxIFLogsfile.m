function [selectedOut,rxIFCalibFullLog] = importHPFRxIFLogsfile(filename, legacyLog)
%IMPORTFILE Import data from a text file
%  [selectedOut,rxIFCalibFullLog]  = IMPORTFILE(FILENAME) reads data
%  from text file FILENAME for the default selection.  Returns the data
%  as a table.
%
%  STRX8520SHA2EE23EDHPFCORRECTEDRUN1 = IMPORTFILE(FILE, DATALINES)
%  reads data for the specified row interval(s) of text file FILENAME.
%  Specify DATALINES as a positive scalar integer or a N-by-2 array of
%  positive scalar integers for dis-contiguous row intervals.
%
%  Example:
%  [selectedOut,rxIFCalibFullLog]  = importHPFRxIFLogsfile("C:\Users\nxf59937\Desktop\STRX-7831\STRX-8520_SHA_2ee23ed_HPF_corrected_run1.txt");
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 23-Feb-2023 15:01:02

%% Input handling

% Datalines defaults
dataLines = [1, Inf];

% Variable cotrolling the number of variables of the import
numberOfLogVariables = 20;

if nargin < 2
    legacyLog = false;
else
    if legacyLog == true
        numberOfLogVariables = 10;
    end
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", numberOfLogVariables);

if (legacyLog == true)
    error('Currently not supported!');
else

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ["[", "]", "|"];

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Var3", "Fine_tune_iteration", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "HPFTarget", "HPFMeasured", "IFHPFRelError", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20"];
opts.SelectedVariableNames = ["Fine_tune_iteration","HPFTarget", "HPFMeasured", "IFHPFRelError"];
opts.VariableTypes = ["string", "string", "string", "double", "string", "string", "string", "string", "string", "string", "string", "double", "double", "double", "string", "string", "string", "string", "string", "string"];


% Specify file level properties
opts.ImportErrorRule = "omitrow";
opts.MissingRule = "omitrow";
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var15", "Var16", "Var17", "Var18", "Var19", "Var20"], "EmptyFieldRule", "auto");

% Import the data
rxIFCalibFullLog = readtable(filename, opts);

selectedOut = rxIFCalibFullLog.IFHPFRelError;

end

end