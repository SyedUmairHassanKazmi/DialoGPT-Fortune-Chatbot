# Download Python from Dockerhub
From python:3.8.10


#Working Directory
WORKDIR /code

#copy the requirements
COPY requirements.txt .
#COPY requirements2.txt .


# Install the Dependencies
RUN pip install --upgrade pip
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN pip install -r requirements.txt

#Copy the flask app to working directory
COPY Source/ .

#Expose port 8080
EXPOSE 8080

#call application
CMD ["python3", "app.py", "serve"]
