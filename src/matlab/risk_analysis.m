function var = calculate_var(returns, confidence_level)
    % Calculates Value at Risk (VaR)
    sorted_returns = sort(returns);
    index = round((1 - confidence_level) * length(sorted_returns));
    var = sorted_returns(index);
end

function cvar = calculate_cvar(returns, confidence_level)
    % Calculates Conditional VaR (CVaR)
    var = calculate_var(returns, confidence_level);
    cvar = mean(returns(returns <= var));
end

% Example usage
% returns = randn(1000, 1) * 0.02;
% var = calculate_var(returns, 0.95);
% cvar = calculate_cvar(returns, 0.95);
% fprintf('VaR: %.4f, CVaR: %.4f\n', var, cvar);
