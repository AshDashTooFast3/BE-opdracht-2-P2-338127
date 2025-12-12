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

            <hr class="my-4"/>
            
            <table class="table table-hover table-striped">
                <thead>
                    <th>Naam</th>
                    <th>Contactpersoon</th>
                    <th>Leveranciernummer</th>
                    <th>Mobiel</th>
                    <th>Aantal Verschillende Producten</th>
                    <th>Toon producten</th>
                </thead>
                <tbody>
                    @forelse ($leveranciers as $leverancier)
                        <tr>
                            <td>{{ $leverancier->LeverancierNaam }}</td>
                            <td>{{ $leverancier->ContactPersoon}}</td>
                            <td>{{ $leverancier->LeverancierNummer}}</td>
                            <td>{{ $leverancier->Mobiel}}</td>
                            <td>{{ $leverancier->AantalVeschillendeProducten }}</td>                       
                           <td class="text-center">
                                <form action="{{ route('producten.index', $leverancier->Id) }}" method="POST">
                                    @csrf
                                    @method('GET')
                                    <button type="submit" class="btn btn-success btn-sm">Toon producten</button>
                                </form>
                            </td>
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