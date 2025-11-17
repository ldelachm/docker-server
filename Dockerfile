FROM python:3.9

# First layer - system updates (this will be cached)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential

# Second layer - install common Python packages (this will be cached)
RUN pip install numpy pandas scipy scikit-learn tensorflow torch matplotlib

# Third layer - create and populate a large dummy file (this will be cached)
RUN dd if=/dev/urandom of=largefile bs=1M count=1000

# Fourth layer - clone a large repository (this will be cached)
RUN git clone https://github.com/tensorflow/models.git

# Final layer - copy your application code (this will change frequently)
COPY . /app/
WORKDIR /app

CMD ["python", "app.py"]

# ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]
