
from fastapi import FastAPI
import pandas as pd
import joblib
from pydantic import BaseModel

app = FastAPI()


class PatientData(BaseModel):
    age: int
    sex: int
    cp: int
    trestbps: int
    chol: int
    fbs: int
    restecg: int
    thalach: int
    exang: int
    oldpeak: int
    slope: int
    ca: int
    thal: int


@app.get('/')  # basic get view
def basic_view():
    return {"Python server 🚀 @8000"}


@app.post('/predict')  # prediction on data
def predict(patient_data: PatientData):
    new_data = pd.DataFrame({
        'age': patient_data.age,
        'sex': patient_data.sex,
        'cp': patient_data.cp,
        'trestbps': patient_data.trestbps,
        'chol': patient_data.chol,
        'fbs': patient_data.fbs,
        'restecg': patient_data.restecg,
        'thalach': patient_data.thalach,
        'exang': patient_data.exang,
        'oldpeak': patient_data.oldpeak,
        'slope': patient_data.slope,
        'ca': patient_data.ca,
        'thal': patient_data.thal,
    }, index=[0])
    loaded_model = joblib.load('heart_pred_model.h5')
  #  loaded_model = pickle.load(open('heart_pred_model.h5','rb'))
    predictions = loaded_model.predict(new_data)  # making predictions
    if predictions[0] == 0:
        return "No Disease"
    else:
        return "Disease"


# https://random-forest-model-for-hdp.herokuapp.com/
# to run : uvicorn pred:app --reload
