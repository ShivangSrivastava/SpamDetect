from getip import get_ip_address
import uvicorn
from fastapi import FastAPI
from controller.prediction import predict

from model.model import InputData


app = FastAPI()

@app.post("/api/check")
def check(data:InputData):
    return predict(data)
if __name__ == "__main__":
    print(f"Server running at {get_ip_address()}:8000")
    uvicorn.run(app, host="0.0.0.0", port=8000)
