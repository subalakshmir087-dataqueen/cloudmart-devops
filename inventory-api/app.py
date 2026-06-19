from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Inventory API is running"

@app.route("/health")
def health():
    return {"status": "healthy"}

@app.route("/items")
def items():
    return {"items": ["laptop", "mouse", "keyboard"]}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8081)
