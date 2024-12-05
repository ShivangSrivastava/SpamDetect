
import re
import joblib
from sklearn.feature_extraction.text import CountVectorizer
from model.model import InputData, OutputData

model = joblib.load("../model/model.joblib")

vectorizer =joblib.load("../model/vectorizer.joblib")

def predict(data: InputData) -> OutputData:
    try:
        vtext = vectorizer.transform([data.text])
        output = model.predict(vtext)
        return OutputData(result=output[0])
    except Exception as e:
        print(f"Error occurred: {e}")
        return OutputData(result="unsure")
