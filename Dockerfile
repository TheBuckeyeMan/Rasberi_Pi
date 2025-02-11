# Use a lightweight base image for Raspberry Pi Zero W (ARMv7) 32 bit archetype
FROM --platform=linux/arm/v7 python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy application files into the container
COPY . /app

# # Install dependencies (if needed)
# RUN pip install --no-cache-dir -r requirements.txt

# Set the default command to run the application
CMD ["python", "app.py"]
