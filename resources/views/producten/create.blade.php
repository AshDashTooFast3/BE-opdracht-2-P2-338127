<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $title }}</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="container my-5 d-flex justify-content-center">
    <div class="col-md-8">
        <h1>{{ $title }}</h1>
        <p>{{ $message }}</p>
        <form action="{{ route('producten.store') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label for="Naam" class="form-label">Naam</label>
                <input type="text" class="form-control" id="Naam" name="Naam" required>
                <div class="form-text">Voer de naam van het product in.</div>
            </div>
            <div class="mb-3">
                <label for="AantalMagazijn" class="form-label">Aantal in magazijn</label>
                <input type="number" class="form-control" id="AantalMagazijn" name="AantalMagazijn" min="0" required>
                <div class="form-text">Voer het aantal producten in het magazijn in.</div>
            </div>
            <div class="mb-3">
                <label for="Verpakkingseenheid" class="form-label">Verpakkingseenheid</label>
                <input type="text" class="form-control" id="Verpakkingseenheid" name="Verpakkingseenheid" required>
                <div class="form-text">Voer de verpakkingseenheid in (bijv. doos, stuk, etc.).</div>
            </div>
            <div class="mb-3">
                <label for="LaatsteLevering" class="form-label">Laatste levering</label>
                <input type="date" class="form-control" id="LaatsteLevering" name="LaatsteLevering" required>
                <div class="form-text">Selecteer de datum van de laatste levering.</div>
            </div>
            <button type="submit" class="btn btn-primary">Opslaan</button>
        </form>
    </div>
</body>
</html>
