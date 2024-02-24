from pydantic import BaseModel


class InputData(BaseModel):
    text: str


class OutputData(BaseModel):
    result: str
