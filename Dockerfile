FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    curl \
    ffmpeg && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /MusicPlayer

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x /startup.sh

CMD ["./startup.sh"]
