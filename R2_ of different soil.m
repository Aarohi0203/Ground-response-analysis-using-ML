%% Load and preprocess data for DUM, REL, and PLR
% Load the input data for DUM, REL, and PLR datasets
inputDUM = DUM;
inputREL = REL;
inputPLR = PLR;

% Remove unnecessary columns from DUM dataset
inputDUM.PGAsurface = [];
inputDUM.TimePeriodT_s__1 = [];
inputDUM.Location = [];
inputDUM.Avg_AmplificationFactor_0_1_1s_ = [];
inputDUM.PredominantFrequency = [];
inputDUM.StationCode = categorical(inputDUM.StationCode); % Convert StationCode to categorical

% Remove unnecessary columns from REL dataset
inputREL.PGAsurface = [];
inputREL.TimePeriodT_s__1 = [];
inputREL.Location = [];
inputREL.Avg_AmplificationFactor_0_1_1s_ = [];
inputREL.PredominantFrequency = [];
inputREL.StationCode = categorical(inputREL.StationCode); % Convert StationCode to categorical

% Remove unnecessary columns from PLR dataset
inputPLR.PGAsurface = [];
inputPLR.TimePeriodT_s__1 = [];
inputPLR.Location = [];
inputPLR.Avg_AmplificationFactor_0_1_1s_ = [];
inputPLR.PredominantFrequency = [];
inputPLR.StationCode = categorical(inputPLR.StationCode); % Convert StationCode to categorical

% Predict outputs using the trained model for each dataset
y_actual_DUM = inputDUM{:, end}; % Extract actual output values for DUM
y_actual_REL = inputREL{:, end}; % Extract actual output values for REL
y_actual_PLR = inputPLR{:, end}; % Extract actual output values for PLR

output_DUM = predict(ashaMdl, inputDUM); % Predict values for DUM dataset
output_REL = predict(ashaMdl, inputREL); % Predict values for REL dataset
output_PLR = predict(ashaMdl, inputPLR); % Predict values for PLR dataset

% Compute R-squared values for DUM dataset
SS_tot_DUM = sum((y_actual_DUM - mean(y_actual_DUM)).^2); % Total sum of squares
SS_res_DUM = sum((y_actual_DUM - output_DUM).^2); % Residual sum of squares
R2_DUM = 1 - (SS_res_DUM / SS_tot_DUM); % Compute R² value

% Compute R-squared values for REL dataset
SS_tot_REL = sum((y_actual_REL - mean(y_actual_REL)).^2); % Total sum of squares
SS_res_REL = sum((y_actual_REL - output_REL).^2); % Residual sum of squares
R2_REL = 1 - (SS_res_REL / SS_tot_REL); % Compute R² value

% Compute R-squared values for PLR dataset
SS_tot_PLR = sum((y_actual_PLR - mean(y_actual_PLR)).^2); % Total sum of squares
SS_res_PLR = sum((y_actual_PLR - output_PLR).^2); % Residual sum of squares
R2_PLR = 1 - (SS_res_PLR / SS_tot_PLR); % Compute R² value

% Display computed R-squared values
fprintf('DUM - R^2: %.5f\n', R2_DUM);
fprintf('REL - R^2: %.5f\n', R2_REL);
fprintf('PLR - R^2: %.5f\n', R2_PLR);

%% Combined Regression Plot
figure;
hold on;

% Scatter plot and regression line for DUM dataset
scatter(y_actual_DUM, output_DUM, 'o', 'MarkerEdgeColor', [0 0.4470 0.7410]); % Blue markers
p1 = polyfit(y_actual_DUM, output_DUM, 1); % Fit a linear regression
yfit1 = polyval(p1, y_actual_DUM);
plot(y_actual_DUM, yfit1, '-', 'Color', [0 0.4470 0.7410], 'LineWidth', 2); % Plot regression line

% Scatter plot and regression line for REL dataset
scatter(y_actual_REL, output_REL, 's', 'MarkerEdgeColor', [0.8500 0.3250 0.0980]); % Orange markers
p2 = polyfit(y_actual_REL, output_REL, 1); % Fit a linear regression
yfit2 = polyval(p2, y_actual_REL);
plot(y_actual_REL, yfit2, '-', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 4); % Plot regression line

% Scatter plot and regression line for PLR dataset
scatter(y_actual_PLR, output_PLR, 'd', 'MarkerEdgeColor', [0.9290 0.6940 0.1250]); % Yellow markers
p3 = polyfit(y_actual_PLR, output_PLR, 1); % Fit a linear regression
yfit3 = polyval(p3, y_actual_PLR);
plot(y_actual_PLR, yfit3, '-', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2); % Plot regression line

% Configure plot properties
xlabel('Actual Values');
ylabel('Predicted Values');
title('Combined Regression Plot for DUM, REL, and PLR');
legend({'DUM Data', 'DUM Regression', 'REL Data', 'REL Regression', 'PLR Data', 'PLR Regression'}, 'Location', 'best');
grid off;
hold off;

% Set font size for axis labels
xlabel('Actual Values', 'FontSize', 16);
ylabel('Predicted Values', 'FontSize', 16);
ax = gca; % Get current axis
ax.FontSize = 16; % Set font size
