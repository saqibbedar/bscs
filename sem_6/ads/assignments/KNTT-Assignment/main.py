import pandas as pd
import numpy as np


"""
K-Nearest Temperature Trends (KNTT) Implementation

This program imputes missing temperature values using historical trends.
Instead of comparing individual values, it compares temperature patterns 
(trends) around a missing value with trends from other years.

Steps:
1. Select a window of days around the missing value (Ω before and after)
2. Compare this trend with same window from other years
3. Compute similarity using average absolute difference
4. Select K most similar years (nearest trends)
5. Predict missing value as average of those K years

Evaluation:
Artificial missing values are introduced and compared with actual values
using ME, MAE, and RMSE.
"""


# Load dataset
df = pd.read_csv("Gilgit.csv")

# Clean unnamed trailing columns and normalize required fields
df = df.loc[:, ~df.columns.str.startswith('Unnamed')].copy()

# Ensure date parsing
if 'Date' not in df.columns:
    # Dataset stores date components separately as YYYY/MM/DD
    df['Date'] = pd.to_datetime(
        df[['YYYY', 'MM', 'DD']].rename(
            columns={'YYYY': 'year', 'MM': 'month', 'DD': 'day'}
        ),
        errors='coerce'
    )
else:
    df['Date'] = pd.to_datetime(df['Date'], errors='coerce')

# Build a working temperature column used by KNTT
if 'Temp' not in df.columns:
    df['Temp'] = (pd.to_numeric(df['TMAX'], errors='coerce') + pd.to_numeric(df['TMIN'], errors='coerce')) / 2

# Extract useful columns
df['Year'] = df['Date'].dt.year
df['DayOfYear'] = df['Date'].dt.dayofyear

# Sort data properly
df = df.sort_values(by=['Year', 'DayOfYear']).reset_index(drop=True)

# Keep original data for evaluation
original_df = df.copy()


# Parameters
OMEGA = 3   # number of days before and after
K = 3       # number of nearest trends


def kntt_impute(df, year, day_index):
    """
    Impute missing temperature using KNTT method

    Distance Formula:
    distance = (1/n) * Σ |Xi - Yi|

    Where:
    Xi = value in target trend
    Yi = value in comparison year trend

    Prediction Formula:
    predicted_value = (1/K) * Σ (values from K nearest years)
    """

    target = df[df['Year'] == year].reset_index(drop=True)

    start = day_index - OMEGA
    end = day_index + OMEGA

    # boundary check
    if start < 0 or end >= len(target):
        return np.nan

    target_window = target.loc[start:end, 'Temp'].values

    # remove missing position (center)
    target_window = np.delete(target_window, OMEGA)

    distances = []

    for other_year in df['Year'].unique():
        if other_year == year:
            continue

        other = df[df['Year'] == other_year].reset_index(drop=True)

        if end >= len(other):
            continue

        other_window = other.loc[start:end, 'Temp'].values
        other_window = np.delete(other_window, OMEGA)

        # skip if any missing values in comparison
        if np.isnan(other_window).any():
            continue

        # Average Absolute Difference
        dist = np.mean(np.abs(target_window - other_window))

        distances.append((other_year, dist))

    # sort by smallest distance
    distances.sort(key=lambda x: x[1])

    # select K nearest years
    nearest_years = [y for y, _ in distances[:K]]

    values = []

    for y in nearest_years:
        other = df[df['Year'] == y].reset_index(drop=True)
        val = other.iloc[day_index]['Temp']

        if not pd.isna(val):
            values.append(val)

    if len(values) == 0:
        return np.nan

    # average of K nearest values
    predicted = np.mean(values)

    return predicted


# Create artificial missing values for testing
test_indices = df.sample(50, random_state=42).index
df.loc[test_indices, 'Temp'] = np.nan


actual = []
predicted = []

for idx in test_indices:
    row = original_df.loc[idx]
    year = row['Year']

    # locate index within that year
    year_df = original_df[original_df['Year'] == year].reset_index(drop=True)
    day_index = year_df.index[year_df['DayOfYear'] == row['DayOfYear']][0]

    pred = kntt_impute(df, year, day_index)

    if not np.isnan(pred):
        actual.append(row['Temp'])
        predicted.append(pred)


actual = np.array(actual)
predicted = np.array(predicted)


"""
Evaluation Metrics:

Mean Error (ME):
ME = (1/n) * Σ (Actual - Predicted)

Mean Absolute Error (MAE):
MAE = (1/n) * Σ |Actual - Predicted|

Root Mean Square Error (RMSE):
RMSE = sqrt( (1/n) * Σ (Actual - Predicted)^2 )
"""

ME = np.mean(actual - predicted)
MAE = np.mean(np.abs(actual - predicted))
RMSE = np.sqrt(np.mean((actual - predicted) ** 2))


print("Evaluation Results")
print("Mean Error (ME):", ME)
print("Mean Absolute Error (MAE):", MAE)
print("Root Mean Square Error (RMSE):", RMSE)