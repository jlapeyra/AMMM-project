import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Carreguem els arxius
results = pd.read_csv('excels/results_2.csv').groupby(['instance', 'alpha']).last().reset_index()
results_opl = pd.read_csv('excels/results-opl_2.csv')

#for i in range(len(results)):
#    results.loc[i, 'score'] = 0 if results.loc[i, 'score'] == -1 else results.loc[i, 'score']

# Calcular la divisió dels scores
results['score_ratio'] = [
    row['score']/results_opl[results_opl['instance'] == row['instance']].reset_index().loc[0, 'score']
    for idx,row in results.iterrows()
]

# Crear un sol gràfic de boxplots per a tots els valors d'alpha
alphas = results['alpha'].unique()

for maxim in (50, 100, 150, 200):
    minim = maxim - 50
    slice = results[(minim < results['instance']) & (results['instance'] <= maxim)]
    slice_opl = results_opl[(minim < results_opl['instance']) & (results_opl['instance'] <= maxim)]
    data = [slice[(slice['alpha'] == alpha) & (slice['score'] != -1)]['score_ratio'] for alpha in alphas]
    
    rates = [sum((slice['alpha'] == alpha) & (slice['score'] != -1))/sum(slice['alpha'] == alpha) for alpha in alphas]
    #rates_opl = [sum(slice_opl['score'] != -1)/len(slice_opl) for alpha in alphas]


    # Crear la figura i els subgràfics
    fig, axs = plt.subplots(2, 1, figsize=(10, 10), gridspec_kw={'height_ratios': [3, 1]})

    # Primer gràfic: boxplot
    axs[0].boxplot(data, tick_labels=alphas)
    axs[0].set_xlabel('Alpha')
    axs[0].set_ylabel('Score Ratio')
    axs[0].set_title(f'Score ratio distribution and solve rate of instances with {minim} < N <= {maxim}')

    # Segon gràfic: rates
    x = np.arange(len(rates))
    axs[1].bar(x, rates, color='skyblue')
    axs[1].set_xticks(x, alphas)  # Set custom labels for x-axis
    axs[1].set_ylim(0, 1)         # Y-axis range from 0 to 1
    axs[1].set_xlabel('Alpha')
    axs[1].set_ylabel('Solve rate')

    # Ajustar i guardar la figura
    plt.tight_layout()
    plt.savefig(f'excels/plot-easy-{minim}-{maxim}.png')
    plt.close()

