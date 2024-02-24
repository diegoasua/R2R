# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Poetry
RUN pip install poetry

# Install the project dependencies with Poetry
# --no-root: Don't install the root package (the project itself), only dependencies
# --no-dev: Don't install packages in the [tool.poetry.dev-dependencies] section
RUN poetry config virtualenvs.create false \
    && poetry install --no-root --no-dev

# Copy the .env.example to .env to apply configurations
# Note: In production, you should use secure ways to manage secrets and environment variables
# COPY .env.example .env

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]