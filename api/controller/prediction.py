
import joblib
from sklearn.feature_extraction.text import CountVectorizer
from model.model import InputData, OutputData



model = joblib.load("../model/model.joblib")

vectorizer =joblib.load("../model/vectorizer.joblib")



def predict(data:InputData)->OutputData:
    text = [data.text]
    vtext = vectorizer.transform(text)
    output = model.predict(vtext)
    return OutputData(result=output[0])
    
