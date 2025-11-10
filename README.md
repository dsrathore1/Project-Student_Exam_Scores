<div align="center">

## 🧠 Student Exam Marks Analysis — ML Model

</div>

A machine learning project to analyze and predict student exam performance using Python’s data science stack. The project is containerized with **Docker** and uses **FastAPI** for API deployment, alongside exploratory data analysis in **Jupyter Notebook**.

I build a Regression ML Pipeline that predicts exam_score from the other features.

---

### 📚 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Setup & Installation](#setup--installation)
- [Running the Application](#running-the-application)
- [Usage](#usage)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [API Endpoints](#api-endpoints)
- [Results](#results)
- [Contributing](#contributing)
- [License](#license)

---

### Overview

This project demonstrates how machine learning can be used to analyze and predict student exam scores based on various features such as study time, attendance, and previous scores.
It includes:

- Data preprocessing and visualization (in Jupyter Notebook)
- Model training and evaluation
- Deployment using **FastAPI** inside a **Docker** container

---

### Features

- 📊 Clean and preprocess data using **Pandas**
- 📈 Visualize performance trends using **Matplotlib** and **Seaborn**
- 🤖 Train regression/classification models to predict exam outcomes
- ⚡ Deploy trained models with **FastAPI**
- 🐳 Containerized deployment using **Docker**

---

### Tech Stack

- **Python 3.10+**
- **FastAPI**
- **Docker**
- **Jupyter Notebook**
- **Pandas**, **NumPy**, **Matplotlib**, **Seaborn**, **Scikit-learn**

---

### Setup & Installation

#### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-username/student-exam-analysis.git
cd student-exam-analysis
```

#### 2️⃣ Create a Virtual Environment

```bash
python -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate
```

#### 3️⃣ Install Dependencies

```bash
pip install -r requirements.txt
```

---

### Running the Application with Docker

Build and run the container:

```bash
docker build -t student-exam-analysis .
docker run -d -p 8000:8000 student-exam-analysis
```

Access the FastAPI app at: [http://localhost:8000/docs](http://localhost:8000/docs)

---

### Usage

- Explore data and train models in **Jupyter Notebook**:

  ```bash
  jupyter notebook
  ```

- Use **FastAPI** endpoints to send new student data and get predictions.

---

### Exploratory Data Analysis (EDA)

Visualize relationships between:

- Study hours vs Exam marks
- Attendance vs Performance
- Previous Scores vs Exam Scores

---

### API Endpoints

| Method | Endpoint   | Description                                         |
| ------ | ---------- | --------------------------------------------------- |
| `POST` | `/predict` | Returns predicted exam score for given student data |
| `GET`  | `/health`  | Health check for the API                            |

Example request:

```json
{
  "study_hours": 5,
  "attendance": 92,
  "previous_score": 80
}
```

---

### Results

- Achieved **R² score of 0.87** on test data
- Insights show that **study hours** and **previous performance** are the strongest predictors of final exam marks

---

### Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the repo
2. Create your feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m 'Add new feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Submit a pull request

---

### License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
