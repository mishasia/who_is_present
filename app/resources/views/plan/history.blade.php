@extends('layouts.app')

@section('content')
    <table class="table">
        <thead>
        <tr>
            <th>Коментар</th>
            <th>Дата початку</th>
            <th>Дата закінчення</th>
        </tr>
        </thead>
        <tbody>
        @foreach($plans as $plan)
            <tr>
                <td>{{ $plan->comment }}</td>
                <td>{{ $plan->date_start }}</td>
                <td>{{ $plan->date_end }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection
