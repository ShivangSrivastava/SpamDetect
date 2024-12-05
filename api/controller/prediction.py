
import re
import joblib
from sklearn.feature_extraction.text import CountVectorizer
from model.model import InputData, OutputData
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords


model = joblib.load("../model/model.joblib")

vectorizer =joblib.load("../model/vectorizer.joblib")

stop_words = set(stopwords.words('english'))

# def preprocess_text(text: str) -> str:
#     text = text.lower()
#     text = re.sub(r'[^a-z\s]', '', text)
#     tokens = word_tokenize(text)
#     tokens = [word for word in tokens if word not in stop_words]
#     preprocessed_text = " ".join(tokens)
#     return preprocessed_text

def predict(data: InputData) -> OutputData:
    try:
        vtext = vectorizer.transform([data.text])
        output = model.predict(vtext)
        return OutputData(result=output[0])
    except Exception as e:
        print(f"Error occurred: {e}")
        return OutputData(result="unsure")
