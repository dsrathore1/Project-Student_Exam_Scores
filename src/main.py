from fastapi import FastAPI, HTTPException
import joblib
import pandas as pd

app = FastAPI()
model = joblib.load("../Models/exam_score_model.pkl")


@app.get("/")
def home():
    return {
        "message": "Hello World",
        "status": HTTPException(status_code=200),
    }


@app.post("/predict")
def predict(data: dict):
    df = pd.DataFrame([data])
    prediction = model.predict(df)[0]
    return {"predicted_exam_score": prediction}
