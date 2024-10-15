from fastapi import FastAPI
from controller.prediction import predict

from model.model import InputData

app = FastAPI()

@app.post("/api/check")
def check(data:InputData):
    return predict(data)