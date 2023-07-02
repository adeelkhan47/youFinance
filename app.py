import json

from bottle import Bottle, run, template, static_file, request, response

app = Bottle()


@app.route('/')
def index():
    categories = getCategories()
    transactions = getTransactions()
    return template('mainpage', vars={'categories': categories, 'transactions': transactions})


@app.route('/saveCategories', method='POST')
def save_categories():
    data = request.json
    for each in getCategories():
        data.append(each)
    saveCategories(data)
    return response.status


@app.route('/saveTransactions', method='POST')
def save_transactions():
    data = request.json
    for each in getTransactions():
        data.append(each)
    saveTransactions(data)
    return response.status


@app.route('/getCategories')
def get_categories():
    categories = getCategories()
    return json.dumps(categories)


@app.route('/getTransactions')
def get_transactions():
    transactions = getTransactions()
    return json.dumps(transactions)


@app.route('/about')
def about():
    return 'This is the about page'


@app.route('/static/<filename:path>')
def serve_static(filename):
    return static_file(filename, root='static')


def getCategories():
    try:
        with open('categories.json', 'r') as file:
            categories = json.load(file)
        return categories
    except Exception as e:
        print("Categories file not found.")
        return {}


def getTransactions():
    try:
        with open('transactions.json', 'r') as file:
            transactions = json.load(file)
        return transactions
    except Exception as e:
        print("Transactions file not found.")
        return {}


def saveCategories(categories):
    with open('categories.json', 'w') as file:
        json.dump(categories, file)


def saveTransactions(transactions):
    with open('transactions.json', 'w') as file:
        json.dump(transactions, file)


if __name__ == '__main__':
    run(app, host='localhost', port=8080)
