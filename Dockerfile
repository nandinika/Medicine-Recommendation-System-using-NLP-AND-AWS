# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Gunicorn will run on
EXPOSE 8080

# Command to run Gunicorn and serve the Flask app
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "main:app"]
