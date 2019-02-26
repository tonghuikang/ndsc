#!/usr/bin/env python
# coding: utf-8

# In[1]:


# references https://www.kaggle.com/mihaskalic/lstm-is-all-you-need-well-maybe-embeddings-also


# In[2]:


from pymagnitude import Magnitude


# In[3]:


vectors = Magnitude("../input/magnitudes/wiki-news-300d-1M.magnitude", 
                    ngram_oov=True)


# In[6]:


import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import numpy as np
train_df = pd.read_csv("../input/ndsc-beginner/train.csv")
submit_df = pd.read_csv("../input/ndsc-beginner/test.csv")


# In[7]:


empyt_emb = np.zeros(300)  

def text_to_array(text):
    embeds = vectors.query(text.split())[:99]
    return np.append(embeds,[empyt_emb] * max(0,100 - len(embeds)), axis=0)


# In[8]:


import time
from tqdm import tqdm # progress bar
start_time = time.time()
train_embeds = []
for X_text in tqdm(train_df["title"][:]):
    train_embeds.append([text_to_array(X_text)])
print(time.time()-start_time)

np.save("train_df-pymag-wiki-feb27.npy", np.array(train_embeds))


# In[9]:


import time  # tdqm don't work well here
start_time = time.time()
submit_embeds = []
for X_text in tqdm(submit_df["title"][:]):
    submit_embeds.append([text_to_array(X_text)])
print(time.time()-start_time)

np.save("submit_df-pymag-wiki-feb27.npy", np.array(submit_embeds))


# In[ ]:




