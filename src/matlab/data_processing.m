function predictions = load_tensorflow_predictions(filepath)
    % Loads TensorFlow predictions from a CSV file
    predictions = readtable(filepath);
    disp('TensorFlow predictions loaded successfully!');
end

function analyze_predictions(predictions, data)
    % Analyzes TensorFlow predictions and compares with actual data
    figure;
    plot(data.timestamp, data.latency, 'LineWidth', 1.5, 'DisplayName', 'Actual Latency');
    hold on;
    plot(data.timestamp, predictions.predicted_latency, '--', 'LineWidth', 1.5, 'DisplayName', 'Predicted Latency');
    title('Actual vs Predicted Latency');
    xlabel('Timestamp');
    ylabel('Latency');
    legend('show');
    grid on;
end

% Example usage
% predictions = load_tensorflow_predictions('results/predictions.csv');
% data = readtable('data/processed/data.csv');
% analyze_predictions(predictions, data);
