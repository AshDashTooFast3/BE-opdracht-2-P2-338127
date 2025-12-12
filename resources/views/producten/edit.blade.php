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

        @if ($productenlevering)
            <p><strong>Product:</strong> {{ $productenlevering[0]->ProductNaam }}</p>
            <p><strong>Leverancier:</strong> {{ $productenlevering[0]->LeverancierNaam }}</p>
            <p><strong>Contactpersoon:</strong> {{ $productenlevering[0]->ContactPersoon }}</p>
            <p><strong>Mobiel:</strong> {{ $productenlevering[0]->Mobiel }}</p>
        @endif

        @if (session('error'))
            <div class="alert alert-danger mt-3">
                {{ session('error') }}
            </div>
            <meta http-equiv="refresh" content="4">
        @endif

        <form action="{{ route('producten.update', ['id' => $productId]) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="mb-3">
                <label for="Aantal" class="form-label">Aantal producteenheden</label>
                <input type="number" class="form-control" id="Aantal" name="Aantal" min="1" required>
            </div>

            <div class="mb-3 hidden">
                <label for="IsActief" class="form-label">IsActief</label>
                <input type="number" class="form-control" id="IsActief" name="IsActief" min="0" max="1" required value="{{ old('IsActief', $productenlevering[0]->IsActief ?? '') }}">
            </div>

            <div class="mb-3">
                <label for="DatumLevering" class="form-label">Datum eerstvolgende levering</label>
                <input type="date" class="form-control" id="DatumLevering" name="DatumLevering" required>
            </div>

            <div class="d-flex justify-content-between align-items-center mt-4">
                <button type="submit" class="btn btn-primary">Sla op</button>

                <div class="d-flex gap-2">
                    <a href="{{ route('producten.index', ['id' => $productenlevering[0]->LeverancierId ?? 1]) }}"
                        class="btn btn-secondary">Terug</a>
                    <a href="{{ route('home') }}" class="btn btn-secondary">Home</a>
                </div>
            </div>
        </form>
    </div>
</body>

</html>