# Use an official Python base image
FROM python:3.9-slim

# Set an environment variable to ensure that Python output is sent straight to the terminal without buffering
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the local files into the container
COPY . .

# Install the necessary dependencies
RUN pip install --no-cache-dir fastapi uvicorn pydantic

# Expose the port the app will run on
EXPOSE 8000

# Command to run the application using Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
