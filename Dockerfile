FROM python:3.6

ENV SDKVERSION 6.8.1
ENV DOWNLOAD https://github.com/vmware/vsphere-automation-sdk-python/archive/v${SDKVERSION}.tar.gz

WORKDIR /var/tmp
RUN curl -SL -o v${SDKVERSION}.tar.gz $DOWNLOAD && \
    tar -xzf v${SDKVERSION}.tar.gz && \
    cd vsphere-automation-sdk-python-${SDKVERSION} && \
    pip install --upgrade --force-reinstall -r requirements.txt --extra-index-url file://`pwd`/lib && \
    mkdir -p /usr/src/app

WORKDIR /usr/src/app

CMD ["python"]
