FROM python:3.6

ENV SDKVERSION 6.8.1
ENV DOWNLOAD https://github.com/vmware/vsphere-automation-sdk-python/archive/v${SDKVERSION}.tar.gz

WORKDIR /var/tmp

# Install Python SDK
RUN curl -SL -o v${SDKVERSION}.tar.gz $DOWNLOAD && \
    tar -xzf v${SDKVERSION}.tar.gz && \
    cd vsphere-automation-sdk-python-${SDKVERSION} && \
    pip install -r requirements.txt --extra-index-url file://`pwd`/lib && \
    cd .. && \
    rm -rf vsphere-automation-sdk-python-${SDKVERSION}/

# Install community samples
RUN mkdir -p /usr/src/app && \
    pip install pyvmomi && \
    git clone https://github.com/vmware/pyvmomi-community-samples /usr/src/pyvmomi-community-samples

WORKDIR /usr/src/app

CMD ["python"]
