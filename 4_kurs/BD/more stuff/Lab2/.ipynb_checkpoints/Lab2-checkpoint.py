import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import seaborn as sns

import warnings
warnings.filterwarnings("ignore", "is_categorical_dtype")
warnings.filterwarnings("ignore", "use_inf_as_na")

mpl.rcParams["font.size"] = 12

df = pd.concat(
    map(pd.read_excel, ['D:/Unik/BigData/Sokalskyi_Ivan__PP41_BigData/Lab2/Data/rollingsales_bronx.xlsx', 'D:/Unik/BigData/Sokalskyi_Ivan__PP41_BigData/Lab2/Data/rollingsales_brooklyn.xlsx',
                       'D:/Unik/BigData/Sokalskyi_Ivan__PP41_BigData/Lab2/Data/rollingsales_manhattan.xlsx','D:/Unik/BigData/Sokalskyi_Ivan__PP41_BigData/Lab2/Data/rollingsales_queens.xlsx'
                       , 'D:/Unik/BigData/Sokalskyi_Ivan__PP41_BigData/Lab2/Data/rollingsales_statenisland.xlsx']), ignore_index=True )

#df = pd.concat( 
#    map(pd.read_excel, ['D:/Unik/BigData/Sokalskyi_Ivan__PP41_BigData/Lab2/Data/rollingsales_bronx.xlsx']), ignore_index=True )

df.loc[df["EASEMENT"].isnull(), "EASEMENT"] = "Doesn't have an easement"
df.loc[df["EASEMENT"]=='', "EASEMENT"] = "Doesn't have an easement"
df.loc[df["EASEMENT"]==0, "EASEMENT"] = "Doesn't have an easement"
df.loc[df["APARTMENT NUMBER"].isnull(), "APARTMENT NUMBER"] = "Not an apartment"
df.loc[df["APARTMENT NUMBER"]=='', "APARTMENT NUMBER"] = "Not an apartment"
df.loc[df["APARTMENT NUMBER"]==0, "APARTMENT NUMBER"] = "Not an apartment"
df.loc[df["RESIDENTIAL UNITS"].isnull(), "RESIDENTIAL UNITS"] = "Doesn't have residential units"
df.loc[df["RESIDENTIAL UNITS"]=='', "RESIDENTIAL UNITS"] = "Doesn't have residential units"
df.loc[df["RESIDENTIAL UNITS"]==0, "RESIDENTIAL UNITS"] = "Doesn't have residential units"
df.loc[df["COMMERCIAL UNITS"].isnull(), "COMMERCIAL UNITS"] = "Doesn't have commercial units"
df.loc[df["COMMERCIAL UNITS"]=='', "COMMERCIAL UNITS"] = "Doesn't have commercial units"
df.loc[df["COMMERCIAL UNITS"]==0, "COMMERCIAL UNITS"] = "Doesn't have commercial units"
df.loc[df["TOTAL UNITS"].isnull(), "TOTAL UNITS"] = "Doesn't have total units"
df.loc[df["TOTAL UNITS"]=='', "TOTAL UNITS"] = "Doesn't have total units"
df.loc[df["TOTAL UNITS"]==0, "TOTAL UNITS"] = "Doesn't have total units"
df.loc[df["LAND SQUARE FEET"].isnull(), "LAND SQUARE FEET"] = "Land square feet is unknown"
df.loc[df["LAND SQUARE FEET"]=='', "LAND SQUARE FEET"] = "Land square feet is unknown"
df.loc[df["LAND SQUARE FEET"]==0, "LAND SQUARE FEET"] = "Land square feet is unknown"
df.loc[df["GROSS SQUARE FEET"].isnull(), "GROSS SQUARE FEET"] = "Gross square feet is unknown"
df.loc[df["GROSS SQUARE FEET"]=='', "GROSS SQUARE FEET"] = "Gross square feet is unknown"
df.loc[df["GROSS SQUARE FEET"]==0, "GROSS SQUARE FEET"] = "Gross square feet is unknown"
df.loc[df["BOROUGH"] == 2, "BOROUGH"] = "Bronx"
df.loc[df["BOROUGH"] == 4, "BOROUGH"] = "Queens"
df.loc[df["BOROUGH"] == 3, "BOROUGH"] = "Brooklyn"
df.loc[df["BOROUGH"] == 1, "BOROUGH"] = "Manhattan"
df.loc[df["BOROUGH"] == 5, "BOROUGH"] = "Staten Island"

df.loc[df["YEAR BUILT"].isnull(), "YEAR BUILT"] = '111111'
df.loc[df["YEAR BUILT"]=='', "YEAR BUILT"] = '111111'
df.loc[df["YEAR BUILT"]=='YEAR BUILT', "YEAR BUILT"] = '111111'
df['YEAR BUILT'] = df['YEAR BUILT'].map(int)
# create a list of our conditions
conditions = [
    (df['YEAR BUILT'] == 111111),
    (df['YEAR BUILT'] < 1900),
    (df['YEAR BUILT'] >= 1900) & (df['YEAR BUILT'] <= 1920),
    (df['YEAR BUILT'] >= 1921) & (df['YEAR BUILT'] <= 1940),
    (df['YEAR BUILT'] >= 1941) & (df['YEAR BUILT'] <= 1960),
    (df['YEAR BUILT'] >= 1961) & (df['YEAR BUILT'] <= 1980),
    (df['YEAR BUILT'] >= 1981) & (df['YEAR BUILT'] <= 2000),
    (df['YEAR BUILT'] >= 2001)
    ]
# create a list of the values we want to assign for each condition
values = ['Year unknown', '1900-', '1900-1920', '1921-1940', '1941-1960', '1961-1980', '1981-2000', '2001+']

# create a new column and use np.select to assign values to it using our lists as arguments
df['TIME PERIOD'] = np.select(conditions, values)
#bronx
dfBronx = df.loc[df["BOROUGH"]=='Bronx']
dfBronxNeighborhoodsSize = dfBronx.groupby('NEIGHBORHOOD').size().reset_index(name = 'Numbers of buildings sold')
dfBronxNeighborhoodsSize =  sns.barplot(x='Numbers of buildings sold', y= 'NEIGHBORHOOD', data=dfBronxNeighborhoodsSize)
dfBronxNeighborhoodsSize.set(title = 'Numbers of buildings sold by Bronx\'s neighborhoods')
plt.show()

dfBronxNeighborhoodsSizeByTimePeriod = dfBronx.groupby(['NEIGHBORHOOD', 'TIME PERIOD']).size().unstack().plot(kind='bar', stacked=True)
dfBronxNeighborhoodsSizeByTimePeriod.set(title = 'Numbers of buildings sold by Bronx\'s neighborhoods')
plt.ylabel('Number of buildings sold')
plt.show()

dfBronxNeighborhoodsTimePeriod = dfBronx.groupby('TIME PERIOD')['NEIGHBORHOOD'].size().reset_index(name = 'Numbers of buildings sold')
dfBronxNeighborhoodsTimePeriod =  sns.barplot(x='Numbers of buildings sold', y= 'TIME PERIOD', data=dfBronxNeighborhoodsTimePeriod)
dfBronxNeighborhoodsTimePeriod.set(title = 'Bronx numbers of buildings sold by time periods')
plt.show()

dfBronxNeighborhoodsMaxSalePrice = dfBronx.groupby('NEIGHBORHOOD')['SALE PRICE'].max().reset_index(name = 'Max sale price')
dfBronxNeighborhoodsMaxSalePrice =  sns.barplot(x='Max sale price', y= 'NEIGHBORHOOD', data=dfBronxNeighborhoodsMaxSalePrice)
dfBronxNeighborhoodsMaxSalePrice.set(title = 'Bronx max sale price by neighborhoods')
plt.show()

dfBronxNeighborhoodsMeanSalePrice = dfBronx.groupby('NEIGHBORHOOD')['SALE PRICE'].median().reset_index(name = 'Median sale price')
print(dfBronxNeighborhoodsMeanSalePrice)
dfBronxNeighborhoodsMeanSalePrice =  sns.barplot(x='Median sale price', y= 'NEIGHBORHOOD', data=dfBronxNeighborhoodsMeanSalePrice)
dfBronxNeighborhoodsMeanSalePrice.set(title = 'Bronx median sale price by neighborhoods')
plt.show()

dfBronxNeighborhoodsSizeByTimePeriod = dfBronx.groupby(['BUILDING CLASS AT TIME OF SALE', 'TIME PERIOD']).size().unstack().plot(kind='bar', stacked=True)
dfBronxNeighborhoodsSizeByTimePeriod.set(title = 'Bronx numbers of buildings sold by building class at time of sale and time period')
plt.ylabel('Number of buildingі built')
plt.show()

indexLandSquareFeet = dfBronx[ (dfBronx['LAND SQUARE FEET']=='Land square feet is unknown')].index
dfBronx.drop(indexLandSquareFeet , inplace=True)
dfBronxNeighborhoodsMeanSalePrice = dfBronx.groupby('NEIGHBORHOOD')['LAND SQUARE FEET'].median().reset_index(name = 'Median land square feet')
dfBronxNeighborhoodsMeanSalePrice =  sns.barplot(x='Median land square feet', y= 'NEIGHBORHOOD', data=dfBronxNeighborhoodsMeanSalePrice)
dfBronxNeighborhoodsMeanSalePrice.set(title = 'Bronx median land square feet by neighborhoods')
plt.show()

#queens
dfQueens = df.loc[df["BOROUGH"]=='Queens']
dfQueensNeighborhoodsSize = dfQueens.groupby('NEIGHBORHOOD').size().reset_index(name = 'Numbers of buildings sold')
dfQueensNeighborhoodsSize =  sns.barplot(x='Numbers of buildings sold', y= 'NEIGHBORHOOD', data=dfQueensNeighborhoodsSize)
dfQueensNeighborhoodsSize.set(title = 'Numbers of buildings sold by Queens\' neighborhoods')
plt.show()

dfQueensNeighborhoodsSizeByTimePeriod = dfQueens.groupby(['NEIGHBORHOOD', 'TIME PERIOD']).size().unstack().plot(kind='bar', stacked=True)
dfQueensNeighborhoodsSizeByTimePeriod.set(title = 'Numbers of buildings sold by Queens\' neighborhoods')
plt.ylabel('Number of buildings sold')
plt.show()

dfQueensNeighborhoodsTimePeriod = dfQueens.groupby('TIME PERIOD')['NEIGHBORHOOD'].size().reset_index(name = 'Numbers of buildings sold')
dfQueensNeighborhoodsTimePeriod =  sns.barplot(x='Numbers of buildings sold', y= 'TIME PERIOD', data=dfQueensNeighborhoodsTimePeriod)
dfQueensNeighborhoodsTimePeriod.set(title = 'Bronx numbers of buildings sold by time periods')
plt.show()

dfQueensNeighborhoodsMaxSalePrice = dfQueens.groupby('NEIGHBORHOOD')['SALE PRICE'].max().reset_index(name = 'Max sale price')
dfQueensNeighborhoodsMaxSalePrice =  sns.barplot(x='Max sale price', y= 'NEIGHBORHOOD', data=dfQueensNeighborhoodsMaxSalePrice)
dfQueensNeighborhoodsMaxSalePrice.set(title = 'Bronx max sale price by neighborhoods')
plt.show()

dfQueensNeighborhoodsMeanSalePrice = dfQueens.groupby('NEIGHBORHOOD')['SALE PRICE'].median().reset_index(name = 'Median sale price')
dfQueensNeighborhoodsMeanSalePrice =  sns.barplot(x='Median sale price', y= 'NEIGHBORHOOD', data=dfQueensNeighborhoodsMeanSalePrice)
dfQueensNeighborhoodsMeanSalePrice.set(title = 'Queens median sale price by neighborhoods')
plt.show()

dfQueensNeighborhoodsSizeByTimePeriod = dfQueens.groupby(['BUILDING CLASS AT TIME OF SALE', 'TIME PERIOD']).size().unstack().plot(kind='bar', stacked=True)
dfQueensNeighborhoodsSizeByTimePeriod.set(title = 'Queens numbers of buildings sold by building class at time of sale and time period')
plt.ylabel('Number of buildingі built')
plt.show()

indexLandSquareFeet = dfQueens[ (dfQueens['LAND SQUARE FEET']=='Land square feet is unknown')].index
dfQueens.drop(indexLandSquareFeet , inplace=True)
dfQueensNeighborhoodsMeanSalePrice = dfQueens.groupby('NEIGHBORHOOD')['LAND SQUARE FEET'].median().reset_index(name = 'Median land square feet')
dfQueensNeighborhoodsMeanSalePrice =  sns.barplot(x='Median land square feet', y= 'NEIGHBORHOOD', data=dfQueensNeighborhoodsMeanSalePrice)
dfQueensNeighborhoodsMeanSalePrice.set(title = 'Queens median land square feet by neighborhoods')
plt.show()

#brooklyn
dfBrooklyn = df.loc[df["BOROUGH"]=='Brooklyn']
dfQueensNeighborhoodsSize = dfQueens.groupby('NEIGHBORHOOD').size().reset_index(name = 'Numbers of buildings sold')
dfQueensNeighborhoodsSize =  sns.barplot(x='Numbers of buildings sold', y= 'NEIGHBORHOOD', data=dfQueensNeighborhoodsSize)
dfQueensNeighborhoodsSize.set(title = 'Numbers of buildings sold by Queens\' neighborhoods')
plt.show()

dfQueensNeighborhoodsSizeByTimePeriod = dfQueens.groupby(['NEIGHBORHOOD', 'TIME PERIOD']).size().unstack().plot(kind='bar', stacked=True)
dfQueensNeighborhoodsSizeByTimePeriod.set(title = 'Numbers of buildings sold by Queens\' neighborhoods')
plt.ylabel('Number of buildings sold')
plt.show()

dfQueensNeighborhoodsTimePeriod = dfQueens.groupby('TIME PERIOD')['NEIGHBORHOOD'].size().reset_index(name = 'Numbers of buildings sold')
dfQueensNeighborhoodsTimePeriod =  sns.barplot(x='Numbers of buildings sold', y= 'TIME PERIOD', data=dfQueensNeighborhoodsTimePeriod)
dfQueensNeighborhoodsTimePeriod.set(title = 'Bronx numbers of buildings sold by time periods')
plt.show()

dfQueensNeighborhoodsMaxSalePrice = dfQueens.groupby('NEIGHBORHOOD')['SALE PRICE'].max().reset_index(name = 'Max sale price')
dfQueensNeighborhoodsMaxSalePrice =  sns.barplot(x='Max sale price', y= 'NEIGHBORHOOD', data=dfQueensNeighborhoodsMaxSalePrice)
dfQueensNeighborhoodsMaxSalePrice.set(title = 'Bronx max sale price by neighborhoods')
plt.show()

dfQueensNeighborhoodsMeanSalePrice = dfQueens.groupby('NEIGHBORHOOD')['SALE PRICE'].median().reset_index(name = 'Median sale price')
dfQueensNeighborhoodsMeanSalePrice =  sns.barplot(x='Median sale price', y= 'NEIGHBORHOOD', data=dfQueensNeighborhoodsMeanSalePrice)
dfQueensNeighborhoodsMeanSalePrice.set(title = 'Queens median sale price by neighborhoods')
plt.show()

dfQueensNeighborhoodsSizeByTimePeriod = dfQueens.groupby(['BUILDING CLASS AT TIME OF SALE', 'TIME PERIOD']).size().unstack().plot(kind='bar', stacked=True)
dfQueensNeighborhoodsSizeByTimePeriod.set(title = 'Queens numbers of buildings sold by building class at time of sale and time period')
plt.ylabel('Number of buildingі built')
plt.show()

indexLandSquareFeet = dfQueens[ (dfQueens['LAND SQUARE FEET']=='Land square feet is unknown')].index
dfQueens.drop(indexLandSquareFeet , inplace=True)
dfQueensNeighborhoodsMeanSalePrice = dfQueens.groupby('NEIGHBORHOOD')['LAND SQUARE FEET'].median().reset_index(name = 'Median land square feet')
dfQueensNeighborhoodsMeanSalePrice =  sns.barplot(x='Median land square feet', y= 'NEIGHBORHOOD', data=dfQueensNeighborhoodsMeanSalePrice)
dfQueensNeighborhoodsMeanSalePrice.set(title = 'Queens median land square feet by neighborhoods')
plt.show()