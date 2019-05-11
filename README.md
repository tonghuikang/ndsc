# National Data Science Competition 2019
Collaborated with [Zheng Xingjian](https://github.com/mrrollingjerry) <br>

We have won the Merit award. Our score is placed 16th on the leaderboard.

## Explanation of approach
The following is our baseline code, with three NLP models and a simple linear blending.

LSTM 
- https://www.kaggle.com/huikang/baseline-lstm-pymag-3cheating-2100/

CNN (the rest of the model is the same)
- https://www.kaggle.com/huikang/mastercopy-conv1d-hk/

GRU (the rest of the model is the same)
- https://www.kaggle.com/huikang/mastercopy-gru-hk/

Ensemble with simple linear blending
- https://www.kaggle.com/huikang/ensemble/

For preprocessing, we used 7 embeddings and pymagnitude, a library that approximates word embeddings.
https://github.com/tonghuikang/ndsc/blob/master/working/ndsc-dataset-tokeniser-presented.ipynb

The result of the tokenisation is available at https://www.kaggle.com/huikang/ndsc900

### Unique features of our solution:
- We used embeddings of size 2100, concatenating 5 embeddings from the English language, and one embedding in Malay and Indonesian each. 
- We also used [pymagnitude](https://github.com/plasticityai/magnitude) to tokenise the embedding, which approximates the embeddings of the nearest tokens if a token is not found in the corpus.
- We used 5-fold cross-validation, and separate models for each of beauty-mobile-fashion to make our submission competitive. - Some manual fine-tuning is done to ensure that parameters are close to optimal.

### Takeaways and additional comments 
- The winning team had only four hours of sleep every day and sacrificed their school work, and the effort necessary to produce a top solution.
- We intended to share a [baseline kernel](https://www.kaggle.com/huikang/baseline-keras-lstm-is-all-you-need) and screw the meta. However, we found something that worked then one week before the end, and then we poured in much effort to get to a competitive ranking. 
- The baseline kernel was adapted from a [kernel](https://www.kaggle.com/mihaskalic/lstm-is-all-you-need-well-maybe-embeddings-also) in Quora Kaggle competition. There are over 300 forks to this kernel in the competition participated by 360 teams.
- Data science is a less cancerous way to start coding seriously, but a competent tech worker still needs holistic competency - i.e. frontend backend and the ability to learn quickly
- Kaggle kernels is a good enough to do most of the data science work - 9 commit GPUs, 7 interactive GPUs. 20GB public and 20GB private dataset. Some version control.
- Cross-validation (aka StratifiedKFold) works and is important. 10-fold cross validation is the standard for data of this amount.
- Do consider the possibility of not using certain information. Here, the images did not improve our final solution as well as many of the teams.
- I also get to gauge the strength and number of data science enthusiasts in Singapore. There are many other teams which spent a lot of purposeful effort in the competition.
- I appreciate the organisers' recognition of the efforts of the participants to share information.
