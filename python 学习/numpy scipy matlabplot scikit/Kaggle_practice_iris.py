# these code are forked from kaggle
# for the Iris data
# https://www.kaggle.com/benhamner/python-data-visualizations
# 31-July-2017

import pandas as pd

# We'll also import seaborn, a Python graphing library
import warnings # current version of seaborn generates a bunch of warnings that we'll ignore
warnings.filterwarnings("ignore")
import seaborn as sns
import matplotlib.pyplot as plt

sns.set(style="white", color_codes=True)

# Next, we'll load the Iris flower dataset, which is in the "../input/" directory
iris = pd.read_csv("./Iris.csv") # the iris dataset is now a Pandas DataFrame

# Let's see what's in the iris data - Jupyter notebooks print the result of the last thing you do
iris.head()

# use pandas function to count species number
iris["Species"].value_counts()

# https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.plot.html
iris.plot(kind="scatter", X="SepalLengthCm", y="PetalLengthCm")
sns.jointplot(x="SepalLengthCm", y="SepalWidthCm", data=iris, size=10)

sns.FacetGrid(iris, hue="Species", size=5) \
   .map(plt.scatter, "SepalLengthCm", "SepalWidthCm") \
   .add_legend()

sns.boxplot(x="Species", y="PetalLengthCm", data=iris)

from pandas.tools.plotting import andrews_curves
andrews_curves(iris.drop("Id", axis=1), "Species")


