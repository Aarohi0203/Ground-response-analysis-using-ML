clc;
clear;

% Load the data from the .mat file
load

% Check if mergedTable exists
if ~exist('mergedTable', 'var')
    error('Variable mergedTable not found. Check the loaded .mat file.');
end

% Display summary of the table
summary(mergedTable);

% Remove missing data (if any) to ensure accurate plotting
mergedTable = rmmissing(mergedTable);

% Define colors for histograms
color1 = [0.2, 0.6, 0.86];  % Sky Blue
color2 = [0.94, 0.33, 0.31];  % Coral Red
color3 = [0.47, 0.67, 0.19];  % Olive Green

% Create a figure to display the graphical summaries
figure;

% Compute dynamic bin size based on data size
numBins = round(sqrt(height(mergedTable))); % Rule of thumb for bin count

% Histogram for numeric variables in mergedTable
subplot(4, 3, 1);
histogram(mergedTable.Vs30, 'FaceColor', color1, 'NumBins', numBins);
xlabel('VS_{30}', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 2);
histogram(mergedTable.Vp30, 'FaceColor', color2, 'NumBins', numBins);
xlabel('VP_{30}', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 3);
histogram(mergedTable.N30, 'FaceColor', color3, 'NumBins', numBins);
xlabel('N_{30}', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 4);
histogram(mergedTable.PGARock_475R_P__, 'FaceColor', color1, 'NumBins', numBins);
xlabel('PGA_{475RP}', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 5);
histogram(mergedTable.Magnitude_Mw_, 'FaceColor', color2, 'NumBins', numBins);
xlabel('Magnitude (Mw)', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 6);
histogram(mergedTable.Distance_R_, 'FaceColor', color3, 'NumBins', numBins);
xlabel('Distance (R)', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 7);
histogram(mergedTable.Time_s_, 'FaceColor', color1, 'NumBins', numBins);
xlabel('Time (sec)', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 8);
histogram(mergedTable.Acceleration_g_, 'FaceColor', color2, 'NumBins', numBins);
xlabel('Acceleration (g)', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 9);
histogram(mergedTable.TimePeriodT_s_, 'FaceColor', color3, 'NumBins', numBins);
xlabel('Time Period (Sec)', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 10);
histogram(mergedTable.Sa_g_, 'FaceColor', color3, 'NumBins', numBins);
xlabel('Sa (g)', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

subplot(4, 3, 11);
histogram(mergedTable.Sa_g__1, 'FaceColor', color3, 'NumBins', numBins);
xlabel('Surface Acceleration (g)', 'FontSize', 14);
ylabel('Frequency', 'FontSize', 14);
grid on;

% Fill the last subplot to maintain spacing or remove empty subplot
subplot(4, 3, 12);
axis off; % Hide the unused subplot

% Adjust subplot spacing and add a title to the figure
sgtitle('Graphical Summary of Variables in mergedTable', 'FontSize', 16);

% Enhance layout readability
set(gcf, 'Position', [100, 100, 1200, 800]); % Adjust figure size for better visibility
