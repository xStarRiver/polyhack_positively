param_grid = {'classifier__C': [0.01, 0.1, 1, 10, 100, 1000,0.001],'vectorizer__max_features': [1010, 5000, 45000, 50000],'vectorizer__sublinear_tf': [True, False],}
pipeline = Pipeline([('vectorizer', TfidfVectorizer()),('classifier', LogisticRegression(max_iter=10000))]) #pipeline
grid_search = GridSearchCV(pipeline, param_grid=param_grid, cv=5, n_jobs=-1, scoring='f1_macro') # Find combination of parameters
grid_search.fit(Xt_small, Yt_small)
print("Best param--->", grid_search.best_params_)     # best parameter combination 
print("Validation Score:", grid_search.best_score_)   #Validation score 
# Evaluating the performance 
best_model = grid_search.best_estimator_
y_pred = best_model.predict(X_test)
print("------TABLE------")
print("-------------------------------------------")
print("Test accuracy:", accuracy_score(y_test, y_pred))
print("Test macro-averaged precision:", precision_score(y_test, y_pred, average='macro'))
print("Test macro-averaged recall:", recall_score(y_test, y_pred, average='macro'))
print("Test F1 score:", f1_score(y_test, y_pred, average='macro'))
print("-------------------------------------------")
