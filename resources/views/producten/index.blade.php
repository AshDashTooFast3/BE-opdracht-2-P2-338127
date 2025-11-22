@vite(['resources/css/app.css', 'resources/js/app.js'])
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Overzicht leveranciers Jamil</title>
</head>

<body class="mt-4">
    <div class="container d-flex justify-content-center ">

        <div class="col-md-10">

            <h1>{{ $title }}</h1>

            <hr class="my-4" />
            @forelse ($leveranciers as $leverancier)
                <p>
                <p>Naam Leverancier: {{ $leverancier->LeverancierNaam }}</p>
                <p>Contactpersoon: {{ $leverancier->ContactPersoon }}</p>
                <p>Leverancier NR: {{ $leverancier->LeverancierNummer }}</p>
                <p>Mobiel: {{ $leverancier->Mobiel }}</p>
                </p>
            @empty
                <p>Geen leverancier gevonden</p>
            @endforelse

            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>Naam product</th>
                        <th>Aantal Magazijn</th>
                        <th>Verpakkingseenheid</th>
                        <th>Laatste levering</th>
                        <th>Nieuwe levering</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($producten as $product)
                        @if ($product->Aantal > 0)
                            <tr>
                                <td>{{ $product->ProductNaam }}</td>
                                <td>{{ $product->Aantal }}</td>
                                <td>{{ $product->VerpakkingsEenheid }} kg</td>
                                <td>{{ $product->DatumLevering }}</td>
                                <td class="text-center">
                                    <a href="{{ route('producten.edit', ['id' => $product->ProductId]) }}"
                                        class="btn btn-danger btn-sm">+</a>
                                </td>
                            </tr>
                        @else
                        <tr>
                            <td colspan="5" class="text-center">Dit bedrijf heeft tot nu toe geen producten geleverd aan Jamin</td>
                        </tr>
                        <meta http-equiv="refresh" content="3;url={{ route('home') }}">
                        @endif
                    @endforeach
                </tbody>
            </table>


            <div class="d-flex justify-content-between align-items-center mt-4">
                <button type="submit" class=""></button>

                <div class="d-flex gap-2">
                    <a href="{{ route('home') }}" class="btn btn-secondary">Terug</a>
                    <a href="{{ route('home') }}" class="btn btn-secondary">Home</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>