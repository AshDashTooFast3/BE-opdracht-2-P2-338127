<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $title }}</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>

<body class="container my-5 d-flex justify-content-center">
    <div class="col-md-8">
        <h1>{{ $title }}</h1>
        <p>{{ $message }}</p>
        <form action="{{ route('producten.store') }}" method="POST">
            @csrf

            @foreach ($productenlevering as $levering)
            @endforeach

            <div class="mb-3 hidden">
                <label for="Naam" class="form-label">Productnaam</label>
                <input type="text" class="form-control" id="Naam" name="Naam" value="{{ $levering->ProductNaam ?? '' }}"
                    required>
            </div>

            <div class="mb-3 hidden">
                <label for="Verpakkingseenheid" class="form-label">Verpakkingseenheid</label>
                <input type="text" class="form-control" id="Verpakkingseenheid" name="Verpakkingseenheid"
                    value="{{ $levering->Verpakkingseenheid ?? '' }}" required>
            </div>

            <div class="mb-3">
                <label for="AantalMagazijn" class="form-label">Aantal producteenheden</label>
                <input type="number" class="form-control" id="AantalMagazijn" name="AantalMagazijn" min="1" required>
                <div class="form-text">Voer het aantal magazijn in.</div>
            </div>

            <div class="mb-3 hidden">
                <label for="LeverancierId" class="form-label">Leverancier ID</label>
                <input type="number" class="form-control" id="LeverancierId" name="LeverancierId"
                    value="{{ $levering->LeverancierId ?? '' }}">
                <div class="form-text">Optioneel: vul in als bekend.</div>
            </div>

            <div class="mb-3 hidden">
                <label for="LaatsteLevering" class="form-label">Datum laatste levering</label>
                <input type="date" class="form-control" id="LaatsteLevering" name="LaatsteLevering"
                    value="{{ $levering->LaatsteLevering ?? '' }}" required>
            </div>

            <div class="mb-3">
                <label for="DatumEerstVolgendeLevering" class="form-label">Datum eerstvolgende levering</label>
                <input type="date" class="form-control" id="DatumEerstVolgendeLevering"
                    name="DatumEerstVolgendeLevering" value="{{ $levering->DatumEerstVolgendeLevering ?? '' }}"
                    required>
            </div>
            <div class="d-flex justify-content-between align-items-center">

                <!-- Links (Sla op) -->
                <button type="submit" class="btn btn-primary">Sla op</button>

                <!-- Rechts (Terug & Home) -->
                <div class="d-flex gap-2">
                    <a href="{{ route('producten.index', ['id' => $levering->Id ?? 1]) }}"
                        class="btn btn-primary">Terug</a>

                    <a href="{{ route('home') }}" class="btn btn-primaryz">Home</a>
                </div>

            </div>
        </form>
    </div>
</body>

</html>