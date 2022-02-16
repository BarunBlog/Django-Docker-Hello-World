# Pull base image

FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
# copy over both the Pipfile and Pipfile.lock files into a /code/ directory in Docker
# --system flag is used to ensure our packages are available throughout the Docker, not virtual environment
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system

# Copy project
COPY . /code/