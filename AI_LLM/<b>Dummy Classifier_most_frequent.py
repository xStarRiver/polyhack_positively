from sklearn.dummy import DummyClassifier
from sklearn.metrics import *
X_1=train_set.head(2000)
X_train = X_1['Text']
y_train = X_1['sentiment']
X_test = test_set['Text']
y_test = test_set['sentiment']
dummy = DummyClassifier(strategy="most_frequent")  
dummy.fit(X_train, y_train)    
y_pred = dummy.predict(X_test) 
at =round(accuracy_score(y_train, y_pred), 3)
pt= (round(precision_score(y_train, y_pred, average='macro'), 3))
rt = (round(recall_score(y_train, y_pred, average='macro'), 3))
f1 = (round(f1_score(y_train, y_pred, average='macro'), 3))
av = (round(accuracy_score(y_test, y_pred), 3))
pv =(round(precision_score(y_test, y_pred, average='macro'), 3))
rv= (round(recall_score(y_test, y_pred, average='macro'), 3))
f1v = (round(f1_score(y_test, y_pred, average='macro'), 3))
print ("Performance metrics for training set")
print("Accuracy:", at)
print("Precision:", pt)
print("Recall:", rt)
print("F1 score:", f1)
print("--------------------------------------")
print ("Performance metrics for validation set")
print("Accuracy:", av)
print("Precision:", pv)
print("Recall:", rv)
print("F1 score:", f1v)
f1v1=f1v
