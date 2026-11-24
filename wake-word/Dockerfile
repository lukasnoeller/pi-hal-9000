FROM python:3.11-slim-bookworm

ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Custom wake word models (the built-in mel-spectrogram and embedding
# models ship inside the wyoming-openwakeword package itself).
COPY wake-words/ ./wake-words/

# tflite-runtime 2.14.0 is the last stable release with an arm64 wheel for
# Python 3.11, which is why this image avoids the TensorFlow-based shim.
RUN pip install --no-cache-dir \
        "numpy==1.26.4" \
        "tflite-runtime==2.14.0" \
        "wyoming==1.5.4" \
    && pip install --no-cache-dir --no-deps "wyoming-openwakeword==1.8.2"

EXPOSE 10400

ENTRYPOINT ["python3", "-m", "wyoming_openwakeword"]
CMD ["--uri", "tcp://0.0.0.0:10400", "--custom-model-dir", "/app/wake-words", "--threshold", "0.75", "--trigger-level", "2", "--debug"]
