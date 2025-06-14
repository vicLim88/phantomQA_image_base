# 🐳 PhantomQA Nvidia AI Container
FROM nvcr.io/nvidia/pytorch:25.05-py3

# Ensure bash and basic tools
RUN apt update && apt install -y \
    wget curl git unzip nano \
    libgl1 libglib2.0-0 \
    python3-pip

# Optional: Set working dir
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Default command
CMD ["bash", "run.sh"]
