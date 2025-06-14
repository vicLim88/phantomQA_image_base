# 🐳 PhantomQA Nvidia AI Container
FROM nvcr.io/nvidia/pytorch:25.05-py3

# Ensure bash and basic tools
RUN apt-get update && apt-get install -y \
    libgl1          \
    libglib2.0-0    \
    ffmpeg          \
    x11-utils       \
    xdotool         \
    wmctrl          \
    curl            \
    && rm -rf /var/lib/apt/lists/*

# Optional: Set working dir
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Create non-root user
RUN useradd -m phantomqa \
 && chown -R phantomqa:phantomqa /app
USER phantomqa

# Default command
CMD ["bash", "run.sh"]
