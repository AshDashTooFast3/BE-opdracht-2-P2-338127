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
                <p>Naam Leverancier: {{ $leverancier->Naam }}</p>
                <p>Contactpersoon: {{ $leverancier->ContactPersoon }}</p>
                <p>Leverancier NR: {{ $leverancier->LeverancierNummer }}</p>
                <p>Mobiel: {{ $leverancier->Mobiel }}</p>
                </p>
            @empty
                <p>Geen leverancier gevonden</p>
            @endforelse

            <table class="table table-hover table-striped">
                <thead>
                    <th>Naam product</th>
                    <th>Aantal Magazijn</th>
                    <th>Verpakkingseenheid</th>
                    <th>Laatste levering</th>
                    <th>Nieuwe levering</th>
                </thead>
                <tbody>
                    @forelse ($producten as $product)
                        <tr>
                            <td>{{ $product->ProductNaam }}</td>
                            <td>{{ $product->AantalMagazijn}}</td>
                            <td>{{ $product->Verpakkingseenheid}}</td>
                            <td>{{ $product->LaatsteLevering}}</td>
                            {{-- <td class="text-center">
                                <form action="{{ route('producten.index', $leverancier->Id) }}" method="POST">
                                    @csrf
                                    @method('GET')
                                    <button type="submit" class="btn btn-danger btn-sm">Allergenen Info</button>
                                </form>
                            </td> --}}
                        </tr>
                    @empty
                        <tr colspan='3'>Geen leveranciers bekend</tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>