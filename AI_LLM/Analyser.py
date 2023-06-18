#Workbase was the data base I have made until the cleaning part 
def polar(x):
    if x>=4:
        return "positive"
    if x==3:
        return "neutral"
    if x<3:
        return "negative"
    
Workbase['sentiment']=Data['Score'].apply(polar)
print(Workbase['sentiment'].value_counts())

from sys import *
plt.figure(figsize=(8,4), tight_layout=True)
x = sns.barplot(x=Workbase['sentiment'], y=Workbase["Score"], palette='pastel', ci=None)
x.set(title='Graph of Value counts', xlabel='Sentiment', ylabel='Average Rating')
plt.show()

train_set, test_set= train_test_split(Workbase, test_size=2000)   
train_set, validation_set= train_test_split(train_set, test_size=.25) 

print("The test set looks like-",test_set.shape)
print("Let's Look into emotions\n",test_set['sentiment'].value_counts())
print("The Training set looks like-",train_set.shape)
print("Let's Look into emotions\n",train_set['sentiment'].value_counts())
print("The Validation set looks like-",validation_set.shape)
print("Let's Look into emotions\n",validation_set['sentiment'].value_counts())


train_set["Text"] = [' '.join(doc) for doc in train_set["Text"]]
validation_set["Text"]= [' '.join(doc) for doc in validation_set["Text"]]

print(train_set)
print(validation_set)

def txt_p(x):
    html_ = html.fromstring(x)
    x = str(html_.text_content())
    tkn = tkn_re(x)
    return tkn

def tkn_re(T):
    tkn = []
    doc = N(T)
    for t in doc:
        if not t.is_stop and not t.is_space and not t.is_punct:
            if t.is_alpha:
                tkn.append(t.lemma_.lower())
    return tkn

tfd = TfidfVectorizer()
R = tfd.fit_transform(train_set["Text"])
J = tfd.fit_transform(validation_set["Text"])
print(R)


nxt, fe = R.shape

def inic(key):
    return R[np.random.choice(nxt, key, replace=False), :].toarray()

def asg(cent):      #Euclidean distance between the data point and each centroid
    dst = cdist(R.toarray(), cent)
    leb = np.argmin(dst, axis=1)
    return leb

def rec(leb, key):
    ls = []
    for j in range(key):
        O = R[leb == j].toarray()
        if O.shape[0] == 0:
            ls.append(inic(1)[0])
        else:
            ls.append(O.mean(axis=0))
    return np.vstack(ls)


#iteratively performs the assignments and centroid updates until convergence 
def K_main(key=5, mx=100):
    cent = inic(key) 
    for i in range(mx):
        leb = asg(cent)
        new = rec(leb, key)
        if np.allclose(cent, new):
            break
        cent = new
    return leb, cent

  
  print(cluster) #Looks fine 
clusters, centroids = K_main(5)
print(cluster)

print(centroids[:100])


for i in range(5):
    doc = train_set.loc[clusters == i]
    print("Documents for cluster", i+1, ":")
    print("\n",doc.head(3))

ci = {}

for j, x in enumerate(clusters):
    if x in ci:
        ci[x].append(j)
    else:
        ci[x] = [j]
        
        
        
cst_leb = [np.bincount(clusters[clusters == i]).argmax() for i in range(0,5)]
# Assignment of  target labels
assigned = [cst_leb[x] for x in clusters]
# assigned=assigned[:2000]
# Confusion matrix(5_clusters)
conf_matrix = confusion_matrix(train_set['Score'], assigned, labels=cst_leb)
ConfusionMatrixDisplay(confusion_matrix=conf_matrix).plot()
print(conf_matrix)
