# Dockerfile pour l'application Flask
FROM python:3.9-slim

# On installe sans forcer les versions pour que ça marche à tous les coups
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# On copie d'abord le fichier de dépendances pour que Docker puisse mettre en cache cette étape si les dépendances n'ont pas changé
COPY app/requirements.txt .

# On installe les dépendances sans forcer les versions pour éviter les problèmes de compatibilité
RUN pip install --no-cache-dir -r requirements.txt

# On copie tout le code de l'application dans le conteneur
COPY app/ .

# On expose le port 5000 pour que l'application soit accessible
EXPOSE 5000

CMD ["python", "app.py"]