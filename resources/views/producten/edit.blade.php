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

        @if ($productenlevering[0]->IsActief == 0)
            <div class="bg-red-500 text-white p-3 rounded mt-4">
                <p>Het product {{ $productenlevering[0]->ProductNaam }} van de leverancier {{ $productenlevering[0]->LeverancierNaam }} wordt niet meer geproduceerd</p>
                <meta http-equiv="refresh" content="4;url={{ route('producten.index', ['id' => $leveranciers[0]->Id ?? 1]) }}">
            </div>
        @else
            <form action="{{ route('producten.update', ['id' => $levering->LeverancierId ?? 1]) }}" method="POST">
                @csrf
                @method('PUT')

                <div class="mb-3">
                    <label for="Aantal" class="form-label">Aantal producteenheden</label>
                    <input type="number" class="form-control" id="Aantal" name="Aantal" min="1" required>
                </div>

                <div class="mb-3">
                    <label for="DatumLevering" class="form-label">Datum eerstvolgende levering</label>
                    <input type="date" class="form-control" id="DatumLevering" name="DatumLevering" required>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-4">
                    <button type="submit" class="btn btn-primary">Sla op</button>

                    <div class="d-flex gap-2">
                        <a href="{{ route('producten.index', ['id' => $leveranciers[0]->Id ?? 1]) }}"
                            class="btn btn-secondary">Terug</a>
                        <a href="{{ route('home') }}" class="btn btn-secondary">Home</a>
                    </div>
                </div>
            </form>
        @endif
    </div>
</body>

</html>