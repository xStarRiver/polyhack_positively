from flask import Flask, jsonify, request
from your_ai_model import YourAIModel

app = Flask(__name__)
model = YourAIModel()

@app.route('/predict', methods=['POST'])
def predict():
    try:
        if request.headers['Content-Type'] != 'application/json':
            raise ValueError('Invalid request format. Expected JSON.')

        data = request.get_json()

        if 'input' not in data:
            raise ValueError('Invalid request format. Missing "input" field.')

        preprocessed_data = preprocess_data(data['input'])
        result = model.predict(preprocessed_data)

        response = {'prediction': result}

        return jsonify(response), 200

    except ValueError as e:
        return jsonify({'error': str(e)}), 400
    except Exception:
        return jsonify({'error': 'An error occurred during prediction.'}), 500

def preprocess_data(input_data):
    preprocessed_data = input_data
    return preprocessed_data

if __name__ == '__main__':
    app.run(debug=True)
