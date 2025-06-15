# 🐳 PhantomQA Nvidia AI Container
FROM nvcr.io/nvidia/pytorch:25.05-py3

LABEL maintainer="PhantomQA Team" \
      description="Docker container for PhantomQA with Nvidia GPU support" \
      version="0.0.11-alpha" 

# Install all required packages
RUN apt-get update && apt-get install -y \
    curl \
    dbus-x11 \
    ffmpeg \
    firefox \
    fonts-dejavu-core \
    gnome-screenshot \
    libglib2.0-0 \
    libgl1 \
    lxde \
    openbox \
    python3-dev \
    python3-tk \
    wget \
    wmctrl \
    x11-utils \
    xdg-utils \
    xdotool \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome and dependencies
RUN apt-get update && apt-get install -y \
    fonts-liberation \
    libu2f-udev \
    libvulkan1 \
    libgl1 \
    libxss1 \
    libasound2t64 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    lsb-release \
    xdg-utils \
    wget && \
    wget -q -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y /tmp/chrome.deb && rm /tmp/chrome.deb

# Set working dir
WORKDIR /app

# Copy project files
COPY . /app

# Make run.sh executable BEFORE switching user
RUN chmod +x /app/run.sh

# Set environment variable
ENV PYTHONPATH="/app"

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --ignore-installed blinker && \
    pip install --no-cache-dir -r requirements.txt

# Create non-root user
RUN useradd -m phantomqa && \
    touch /home/phantomqa/.Xauthority && \
    chown -R phantomqa:phantomqa /app /home/phantomqa
USER phantomqa

# Default command
CMD ["/app/run.sh"]
