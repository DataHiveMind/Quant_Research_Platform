import pandas as pd

def load_data(filepath):
    """
    Loads financial data from a CSV file.
    """
    data = pd.read_csv(filepath)
    print(f"Data loaded from {filepath}")
    return data

def preprocess_data(data):
    """
    Preprocess financial data for modeling.
    """
    data['log_returns'] = np.log(data['close'] / data['close'].shift(1))
    data = data.dropna()
    print("Data preprocessing completed!")
    return data
