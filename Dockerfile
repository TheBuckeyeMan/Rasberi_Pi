# Use a lightweight Python image for Raspberry Pi
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application files
COPY app.py .

# Run the application
CMD ["python3", "app.py"]
