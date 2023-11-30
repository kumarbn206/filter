
function memoryDumpFFT = importfileFromFFT(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   MEMORYDUMPFFTSINWAVERXMODE41 = IMPORTFILE(FILENAME)
%   Reads data from text file FILENAME for the default selection.
%
%   MEMORYDUMPFFTSINWAVERXMODE41 = IMPORTFILE(FILENAME, STARTROW, ENDROW)
%   Reads data from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   memoryDumpFFTSinWaveRxMode41 = importfile('memoryDumpFFTSinWaveRxMode4-1.txt', 1, 64);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2022/04/25 14:55:00

%% Initialize variables.
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% Format for each line of text:
%   column1: text (%s)
%	column2: text (%s)
%   column3: text (%s)
%	column4: text (%s)
%   column5: text (%s)
%	column6: text (%s)
%   column7: text (%s)
%	column8: text (%s)
%   column9: text (%s)
%	column10: text (%s)
%   column11: text (%s)
%	column12: text (%s)
%   column13: text (%s)
%	column14: text (%s)
%   column15: text (%s)
%	column16: text (%s)
%   column17: text (%s)
%	column18: text (%s)
%   column19: text (%s)
%	column20: text (%s)
%   column21: text (%s)
%	column22: text (%s)
%   column23: text (%s)
%	column24: text (%s)
%   column25: text (%s)
%	column26: text (%s)
%   column27: text (%s)
%	column28: text (%s)
%   column29: text (%s)
%	column30: text (%s)
%   column31: text (%s)
%	column32: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%2s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%3s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this code. If an error occurs for a different file, try regenerating the code from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Remove white space around all cell columns.
for(count = 1:32)
    dataArray{count} = strtrim(dataArray{count});
end


%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post processing code is included. To generate code which works for unimportable data, select unimportable cells in a file and regenerate the script.

%% Create output variable
memoryDumpFFT = [dataArray{1:end-1}];


end
