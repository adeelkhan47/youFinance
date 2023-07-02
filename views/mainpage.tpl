<!DOCTYPE html>
<html>

<head>
  <!-- Vorabverbindung zu Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

  <!-- Einbinden der Open Sans Schriftart -->
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,500&display=swap" rel="stylesheet">

  <!-- Einbinden der eigenen CSS-Datei -->
  <link rel="stylesheet" type="text/css" href="/static/style.css">
  <script src="/static/home.js"></script>

</head>

<body>
  <!-- Ein div-Element mit der Klasse "FinancePro" und dem Text "Finance Pro" -->
  <div class="FinancePro">
    Finance Pro
  </div>

  <!-- Ein div-Element mit der Klasse "AllesAEB" und dem Text "Alles auf einen Blick" -->
  <div class="AllesAEB">
    Alles auf einen Blick
  </div>

  <!-- Ein div-Element mit der Klasse "Bild" und einem Bild mit der Quelle "geld.png" -->
  <div class="Bild">
    <img src="/static/geld.png" width="700" height="500" alt="...">
  </div>

  <!-- Ein div-Element mit der Klasse "Part1" -->
  <div class="Part1">

    <form>
      <!-- Ein Label-Element mit der Klasse "Name" und dem Text "Name:" -->
      <label class="Name" for="name">Name:</label>
      <!-- Ein Eingabefeld vom Typ "text" mit dem Namen "name" -->
      <input type="text" id="categoryName" name="name">
    </form>

    <!-- Ein div-Element mit der Klasse "Farbe" -->
    <div class="Farbe">
      <!-- Ein Label-Element mit dem Text "Farbe:" -->
      <label for="name">Farbe:</label>
      <!-- Ein Button-Element mit dem Text "Farbe" und einem onClick-Event "openPopup()", um ein Pop-up-Fenster zu öffnen -->
      <button onclick="openPopup()">Farbe</button>
    </div>

    <!-- Ein div-Element mit der ID "colorPickerPopup" und der Klasse "popup-overlay" -->
    <div id="colorPickerPopup" class="popup-overlay">
      <!-- Ein div-Element mit der Klasse "popup-content" -->
      <div class="popup-content">
        <!-- Ein div-Element mit der Klasse "color-picker" -->
        <div class="color-picker">
          <!-- Verschiedene div-Elemente mit der Klasse "color-circle" und unterschiedlichen Hintergrundfarben -->
          <div class="color-circle" style="background-color: red" onclick="selectColor('red')"></div>
          <div class="color-circle" style="background-color: green" onclick="selectColor('green')"></div>
          <div class="color-circle" style="background-color: blue" onclick="selectColor('blue')"></div>
          <div class="color-circle" style="background-color: rgb(0, 255, 191)" onclick="selectColor('rgb(0, 255, 191)')"></div>
          <div class="color-circle" style="background-color: rgb(255, 123, 0)" onclick="selectColor('rgb(255, 123, 0)')"></div>
          <div class="color-circle" style="background-color: rgb(64, 0, 255)" onclick="selectColor('rgb(64, 0, 255)')"></div>
          <div class="color-circle" style="background-color: rgb(251, 0, 255)" onclick="selectColor('rgb(251, 0, 255)')"></div>
          <div class="color-circle" style="background-color: rgb(0, 0, 0)" onclick="selectColor('rgb(0, 0, 0)')"></div>
          <div class="color-circle" style="background-color: rgb(192, 192, 176)" onclick="selectColor('rgb(192, 192, 176)')"></div>
          <div class="color-circle" style="background-color: rgb(43, 84, 0)" onclick="selectColor('rgb(43, 84, 0)')"></div>
        </div>
        <!-- Ein Button-Element mit dem Text "Schließen" -->
        <button onclick="closePopup()">Schließen</button>
      </div>
    </div>

    <!-- Eine Tabelle mit der Klasse "category-table" -->
    <table class="category-table">
      <thead>
        <tr>
          <!-- Tabellenüberschriften -->
          <th>Name</th>
          <th>Farbe</th>
          <th></th>
        </tr>
      </thead>
      <!-- Ein Tabellenkörper mit der ID "categoryList" -->
      <tbody id="categoryList"></tbody>
    </table>

    <!-- Ein div-Element mit der Klasse "dropdown-container" -->
    <div class="dropdown-container">
      <!-- Ein Label-Element mit der Klasse "Kategorien" und dem Text "Kategorien:" -->
      <label for="categoryDropdown" class="Kategorien">Kategorien:</label>
      <!-- Ein Select-Element mit der ID "categoryDropdown" -->
      <select id="categoryDropdown">
      </select>
    </div>

    <!-- Ein div-Element mit der Klasse "Betrag-container" -->
    <div class="Betrag-container">
      <!-- Ein Label-Element mit der Klasse "Kategorien" und dem Text "Betrag:" -->
      <label for="categoryDropdown" class="Kategorien">Betrag:</label>
      <!-- Ein Eingabefeld vom Typ "number" mit dem Attribut "step" und der ID "amount" -->
      <input type="number" step="0.01" id="amount" name="amount">
    </div>

    <!-- Ein Button-Element mit der Klasse "Button2" und dem Text "Speichern", das beim Klicken das Event "saveData()" auslöst -->
    <button class="Button2" onclick="saveData()">Speichern</button>

    <!-- Eine weitere Tabelle mit der Klasse "category-table" -->
    <table class="category-table">
      <thead>
        <tr>
          <!-- Die Tabellenüberschriften -->
          <th>Datum</th>
          <th>Kategorie</th>
          <th>Betrag</th>
          <th></th>
        </tr>
      </thead>
      <!-- Ein Tabellenkörper mit der ID "transactionList" -->
      <tbody id="transactionList"></tbody>
    </table>

    <div>
      <!-- Ein Label-Element mit der Klasse "Summe" und dem Text "Summe:" -->
      <label class="Summe" for="sum"></label>
      <!-- Ein Eingabefeld vom Typ "text" mit der ID "sum" und dem Attribut "disabled" -->
      <input type="text" id="sum" disabled>
    </div>
  </div>
</body>

</html>
