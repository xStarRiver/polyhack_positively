import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import nltk
import random
import re
import spacy
from lxml import *
from nltk.corpus import *
from spacy.lang.en.stop_words import *
from spacy.lang.en import *
import string
from scipy.spatial.distance import *
from sklearn.model_selection import *
from sklearn.metrics import *
from sklearn.feature_extraction.text import *
from sklearn.model_selection import *
from sklearn.pipeline import *
from sklearn.metrics.pairwise import *
from nltk.stem import*
from nltk.corpus import stopwords
from urllib.request import urlopen
from bs4 import BeautifulSoup
from nltk import*

from google.colab import drive
drive.mount('/content/drive')

Data= pd.read_csv('/content/drive/MyDrive/Reviews.csv') #importing the file in the notebook 
Data.head() #checking the data
Data.shape

Data["Score"].value_counts().sort_index().plot(kind="bar",title="User's Rating",figsize=(10,10)) 
Data['Text']= Data['Text'].apply(lambda x:" ".join(x.lower() for x in x.split())) #just converting all into lower case

Data['Text']= Data['Text'].str.replace('[^\w\s]','')

nltk.download('stopwords')
','.join(stopwords.words('english')) 

Stop_Words=set(stopwords.words('english'))

def Remove_Stopwords(x):                                                           #function to remove the stop words
    return " ".join([word for word in str(x).split() if word not in Stop_Words]) 
  
Data['Text']=Data['Text'].apply(lambda x:Remove_Stopwords(x))
  
w_tk=nltk.tokenize.WhitespaceTokenizer()
lem=WordNetLemmatizer()

def lemma(x):                                              #I feel like I am becoming like a python function myself ;-0
    return [lem.lemmatize(w) for w in w_tk.tokenize(x)]
  
nltk.download('wordnet')
Data['Text']=Data['Text'].apply(lambda x: lemma(x))

Workbase=Workbase.drop(["Id","ProductId","UserId","Time","HelpfulnessNumerator","HelpfulnessDenominator","ProfileName",'Summary'], axis = 1)
Workbase.head(5)

Workbase.to_csv('Workbase.csv', index=False) 

print('The number of reviews used for training should be[60%]--->', int(0.6*10000))
print('The number of reviews used for validation be[20%]--->',int(0.2*10000))
print('The number of reviews used for test be[20%]--->',int(0.2*10000))

