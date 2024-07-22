FROM python:3.8-slim

RUN pip install --upgrade pip
RUN pip install jupyter

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

WORKDIR /workspace

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
