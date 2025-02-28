clc;  % Clear the command window
clear;  % Clear all variables from the workspace

% Load the data from the .mat file


% Display a summary of the mergedTable dataset
summary(mergedTable);

% Extract the variables of interest from mergedTable
variablesToAnalyze = mergedTable{:, {'Vs30', 'Vp30', 'N30', 'PGARock_475R_P__', ...
    'Magnitude_Mw_', 'Distance_R_', 'Time_s_', 'Acceleration_g_', ...
    'TimePeriodT_s_', 'Sa_g_', 'Sa_g__1'}};

% Define variable labels for better readability in the plot
variableLabels = {'VS_{30}', 'VP_{30}', 'N_{30}', 'PGA_{475RP}', ...
    'Magnitude (Mw)', 'Distance (R)', 'Time (sec)', 'Acceleration (g)', ...
    'Time Period (sec)', 'Sa (g)', 'Surface Acceleration (g)'};

% Determine the number of variables to analyze
numVariables = size(variablesToAnalyze, 2);

% Create a new figure for the pair plot visualization
figure;
hold on;  % Retain current plot while adding new plots

% Generate a grid of scatter plots and histograms
for i = 1:numVariables
    for j = 1:numVariables
        % Create subplot for each pair of variables
        subplot(numVariables, numVariables, (i-1)*numVariables + j);
        
        if i == j
            % Diagonal plots: Display histogram for each individual variable
            histogram(variablesToAnalyze(:, i), 'FaceColor', 'b', 'EdgeColor', 'k');
        else
            % Off-diagonal plots: Display scatter plots between different variables
            scatter(variablesToAnalyze(:, j), variablesToAnalyze(:, i), 'filled');
        end
        
        % Adjust axis limits for better visualization
        axis tight;
        grid on;
    end
end

% Add an x-axis label (position adjusted for better readability)
xlabel('Variables', 'FontSize', 12, 'Position', [0.5 -0.1], 'Units', 'normalized');

% Add a y-axis label (position adjusted for better readability)
ylabel('Variables', 'FontSize', 12, 'Position', [-0.1 0.5], 'Units', 'normalized', 'Rotation', 90);

% Add a title to the entire figure
sgtitle('Pair Plot of Variables with Rotated Labels', 'FontSize', 14);

hold off;  % Release hold on the figure
