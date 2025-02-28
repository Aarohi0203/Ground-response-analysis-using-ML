clc;
clear;

% Load the data from the .mat file
load

% Provided headers with LaTeX-style formatting for subscripts
headers = {'VS_{30}', 'VP_{30}', 'N_{30}', 'PGA_{475RP}', 'Magnitude (Mw)', ... 
           'Distance (R)', 'Time (sec)', 'Acceleration (g)', 'Time Period (T(sec))', ...
           'Sa (g)', 'Surface Acceleration (g)'};

% Convert the required data from mergedTable to an array
data = table2array(mergedTable(:, 4:14));

% Normalize the data using min-max normalization
dataNormalized = (data - min(data)) ./ (max(data) - min(data));

% Define custom colors for each box in the box plot
colors = [
    0.2 0.6 0.86;  % Sky Blue
    0.94 0.33 0.31;  % Coral
    0.47 0.67 0.19;  % Olive Green
    0.85 0.33 0.1;   % Burnt Orange
    0.39 0.83 0.07;  % Spring Green
    0.9 0.76 0.12;   % Mustard Yellow
    0.3 0.75 0.93;   % Light Blue
    0.8 0.4 0.4;     % Light Brown
    0.45 0.76 0.95;  % Cyan
    0.7 0.4 0.8;     % Lavender
    0.9 0.5 0.6;     % Pink
];

% Create a figure for the box-and-whisker plot
figure;

% Generate the boxplot with labels
h = boxplot(dataNormalized, 'Labels', headers, 'LabelOrientation', 'inline', 'Widths', 0.7);

% Increase line width for better visibility
set(h, 'LineWidth', 1.5); 

% Apply custom colors to each box
for i = 1:length(headers)
    % Get the patch object for each box and set its color
    patch = findobj(gca, 'Tag', 'Box', 'UserData', i);
    if ~isempty(patch)
        % Change patch color and remove edges
        set(patch, 'FaceColor', colors(i, :), 'EdgeColor', 'none');
    end
end

% Add title and labels
title('Colorful Box-and-Whisker Plot for Normalized Data', 'FontSize', 14);
xlabel('Variables', 'FontSize', 12);
ylabel('Normalized Values', 'FontSize', 12);

% Ensure subscript formatting is interpreted correctly
set(gca, 'TickLabelInterpreter', 'tex');

% Show grid
grid on;
