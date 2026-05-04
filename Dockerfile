FROM python:3.11-slim

# Install system dependencies for headless GUI + VNC
RUN apt-get update && apt-get install -y \
    xvfb \
    x11-utils \
    libgl1-mesa-dri \
    libglx-mesa0 \
    libglib2.0-0 \
    x11vnc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code and entrypoint
COPY . .

RUN chmod +x entrypoint.sh

# Run entrypoint with VNC + game
CMD ["./entrypoint.sh"]