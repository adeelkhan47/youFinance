// Current date
var currentDate = new Date();

// Sum variable for transactions
var sum = 0;

// Load categories from a file on page load
function loadCategories() {
  fetch('/getCategories')
    .then(response => response.json())
    .then(data => renderCategories(data));
}

// Save categories to a file
function saveCategories(categories) {
  fetch('/saveCategories', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(categories),
  });
}

// Load transactions from a file on page load
function loadTransactions() {
  fetch('/getTransactions')
    .then(response => response.json())
    .then(data => renderTransactions(data));
}

// Save transactions to a file
function saveTransactions(transactions) {
  fetch('/saveTransactions', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(transactions),
  });
}

// Opens the pop-up window
function openPopup() {
  var colorPickerPopup = document.getElementById('colorPickerPopup');
  colorPickerPopup.style.opacity = 1;
  colorPickerPopup.style.pointerEvents = 'auto';
}

// Closes the pop-up window
function closePopup() {
  var colorPickerPopup = document.getElementById('colorPickerPopup');
  colorPickerPopup.style.opacity = 0;
  colorPickerPopup.style.pointerEvents = 'none';
}

// Is called when a color has been selected
function selectColor(color) {
  var categoryList = document.getElementById('categoryList');
  var categoryNameInput = document.getElementById('categoryName');
  var categoryDropdown = document.getElementById('categoryDropdown');
  var categoryName = categoryNameInput.value;

  if (categoryName) {
    var row = categoryList.insertRow();
    var nameCell = row.insertCell(0);
    var colorCell = row.insertCell(1);
    var deleteCell = row.insertCell(2);

    nameCell.textContent = categoryName;
    colorCell.style.backgroundColor = color;
    deleteCell.innerHTML = '<button class="delete-button" onclick="deleteRow(this)">Löschen</button>';

    var option = document.createElement('option');
    option.value = categoryName;
    option.text = categoryName;
    categoryDropdown.add(option);

    var storedCategories = localStorage.getItem('categories');
    var categories = storedCategories ? JSON.parse(storedCategories) : [];
    categories.push({ name: categoryName, color: color });
    saveCategories(categories);
  } else {
    alert('Bitte geben Sie einen Namen ein.');
  }

  categoryNameInput.value = '';
  closePopup();
}

// Deletes a row (category or transaction)
function deleteRow(button) {
  var sumInput = document.getElementById('sum');
  var categoryDropdown = document.getElementById('categoryDropdown');
  var categoryList = document.getElementById('categoryList');
  var row = button.parentNode.parentNode;

  if (row.parentNode === categoryList) {
    var categoryName = row.cells[0].textContent;
    var options = categoryDropdown.options;

    for (var i = 0; i < options.length; i++) {
      if (options[i].text === categoryName) {
        categoryDropdown.remove(i);
        break;
      }
    }

    var storedCategories = localStorage.getItem('categories');
    var categories = storedCategories ? JSON.parse(storedCategories) : [];
    categories = categories.filter(function (category) {
      return category.name !== categoryName;
    });
    saveCategories(categories);
  }

  row.parentNode.removeChild(row);
}

// Save a transaction
function saveData() {
  var transactionList = document.getElementById('transactionList');
  var categoryDropdown = document.getElementById('categoryDropdown');
  var sumInput = document.getElementById('sum');
  var amountInput = document.getElementById('amount');
  var selectedCategory = categoryDropdown.value;
  var amount = parseFloat(amountInput.value);

  if (selectedCategory && amount) {
    var row = transactionList.insertRow();
    var dateCell = row.insertCell(0);
    var categoryCell = row.insertCell(1);
    var amountCell = row.insertCell(2);
    var deleteCell = row.insertCell(3);

    dateCell.textContent = currentDate.toLocaleDateString();
    categoryCell.textContent = selectedCategory;
    amountCell.textContent = amount.toFixed(2);
    deleteCell.innerHTML = '<button class="delete-button" onclick="deleteRow(this)">Löschen</button>';

    sum += amount;
    sumInput.value = sum.toFixed(2);

    var storedTransactions = localStorage.getItem('transactions');
    var transactions = storedTransactions ? JSON.parse(storedTransactions) : [];
    transactions.push({ date: currentDate.toLocaleDateString(), category: selectedCategory, amount: amount.toFixed(2) });
    saveTransactions(transactions);

    amountInput.value = '';
  } else {
    alert('Bitte wählen Sie eine Kategorie und geben Sie einen Betrag ein.');
  }
}

// Render categories on page load
function renderCategories(categories) {
  var categoryList = document.getElementById('categoryList');
  var categoryDropdown = document.getElementById('categoryDropdown');

  categories.forEach(function (category) {
    var row = categoryList.insertRow();
    var nameCell = row.insertCell(0);
    var colorCell = row.insertCell(1);
    var deleteCell = row.insertCell(2);

    nameCell.textContent = category.name;
    colorCell.style.backgroundColor = category.color;
    deleteCell.innerHTML = '<button class="delete-button" onclick="deleteRow(this)">Löschen</button>';

    var option = document.createElement('option');
    option.value = category.name;
    option.text = category.name;
    categoryDropdown.add(option);
  });
}

// Render transactions on page load
function renderTransactions(transactions) {
  var transactionList = document.getElementById('transactionList');
  var sumInput = document.getElementById('sum');

  transactions.forEach(function (transaction) {
    var row = transactionList.insertRow();
    var dateCell = row.insertCell(0);
    var categoryCell = row.insertCell(1);
    var amountCell = row.insertCell(2);
    var deleteCell = row.insertCell(3);

    dateCell.textContent = transaction.date;
    categoryCell.textContent = transaction.category;
    amountCell.textContent = transaction.amount;
    deleteCell.innerHTML = '<button class="delete-button" onclick="deleteRow(this)">Löschen</button>';

    sum += parseFloat(transaction.amount);
  });

  sumInput.value = sum.toFixed(2);
}

// Load categories and transactions on page load
document.addEventListener('DOMContentLoaded', function () {
  loadCategories();
  loadTransactions();
});
