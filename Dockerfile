
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 8080

CMD ["python", "app.py"]
