# Image de base
FROM python:3.9-slim

# Installation des dépendances système
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie le fichier de dépendances
COPY app/requirements.txt .

# Installation des dépendances Python
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copie du reste du code
COPY app/ .

# PORT
EXPOSE 5000

CMD ["python", "app.py"]