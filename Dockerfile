# Image de base (un peu ancienne pour garantir quelques vulnérabilités au scan)
FROM python:3.9-slim

WORKDIR /app

# Copie le fichier de dépendances généré
COPY app/requirements.txt .

# Installation des dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copie du reste du code de l'app
COPY app/ .

# Port par défaut
EXPOSE 5000

CMD ["python", "app.py"]