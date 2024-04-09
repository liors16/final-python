# Use an official Python 3.7 image.
FROM python:3.7-slim

# Set the working directory in the container.
WORKDIR /app

# Copy the Pipfile and Pipfile.lock into the container at /app.
COPY Pipfile Pipfile.lock /app/

# Install pipenv and dependencies from the Pipfile.
RUN pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install --deploy --ignore-pipfile

# Copy the rest of your application's code into the container at /app.
COPY . /app

# Make port 5000 available to the world outside this container.
EXPOSE 5000

# Define the command to run your application.
# pipenv run is used to ensure we're executing within the virtualenv.
CMD ["pipenv", "run", "python", "app.py"]
