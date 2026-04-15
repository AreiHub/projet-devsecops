# Image de base
FROM python:3.9-slim

# Installation des dépendances avec versions figées (Pinning)
# On ajoute le flag -y pour valider et on nettoie le cache
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential=12.9 \
    gcc=4:10.2.1-1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# On évite le --upgrade pip sans version ou on s'en passe car 
# l'image python:3.9-slim est déjà assez à jour
COPY app/requirements.txt .

# Installation des dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie du reste du code
COPY app/ .

# Exposition du port de l'application
EXPOSE 5000

CMD ["python", "app.py"]