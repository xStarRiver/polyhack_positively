import nltk
from nltk.corpus import wordnet
from nltk.sentiment import SentimentIntensityAnalyzer
from Analyser import analyze_sentiment
from cleaning import preprocess_data
from AccuracyAnalyser import calculate_accuracy
from api import send_data_to_mobile_app

def get_synonyms(word):
    synonyms = set()
    for synset in wordnet.synsets(word):
        for lemma in synset.lemmas():
            synonyms.add(lemma.name())
    return list(synonyms)

def filter_positive_words(words):
    sid = SentimentIntensityAnalyzer()
    positive_words = []

    for word in words:
        synonyms = get_synonyms(word)
        positive_synonyms = []

        for synonym in synonyms:
            sentiment_score = sid.polarity_scores(synonym)['compound']
            if sentiment_score > 0:
                positive_synonyms.append(synonym)

        if len(positive_synonyms) > 1:
            positive_words.append(positive_synonyms[1])

    return positive_words

def process_user_input(user_input):
    tokens = nltk.word_tokenize(user_input)
    preprocessed_tokens = preprocess_data(tokens)
    return filter_positive_words(preprocessed_tokens)

def run_program():
    while True:
        user_input = input("Enter your text (or 'exit' to quit): ")
        if user_input.lower() == 'exit':
            break

        suggested_words = process_user_input(user_input)

        print("Original Text:", user_input)
        print("Suggested Words:", suggested_words)
        print()


        sentiment_score = analyze_sentiment(user_input)
        print("Sentiment Score:", sentiment_score)


        accuracy = calculate_accuracy()
        print("Accuracy:", accuracy)

        send_data_to_mobile_app(user_input, suggested_words, sentiment_score, accuracy)

run_program()
