@extends('layouts.app')

@section('content')

    <h3>Історія оголошеннь:</h3>
    <table class="table">
        <thead>
        <tr>
            <th>Коментар</th>
            <th>Дата початку</th>
            <th>Дата закінчення</th>
            <th>Коментарі</th>
            <th>Дія</th>
        </tr>
        </thead>
        <tbody>
        @foreach($plans as $plan)
            <tr>
                <td>{{ $plan->comment }}</td>
                <td>{{ $plan->date_start }}</td>
                <td>{{ $plan->date_end }}</td>
                <td><a class="btc btc-primary" href="{{ route('comment.history', $plan->id) }}">Коментарі</a></td>
                <td>
                    <a href="{{ route('plan.edit', $plan->id) }}"> <i class="glyphicon glyphicon-edit"></i>  </a>


                    {!! Form::open(['method'=>'DELETE',
                    'route' => ['plan.remove', $plan->id]])  !!}
                    <button onclick=" return confirm('Ви точно хочете видалити?')"
                            style="
                            background: transparent;
                            border: none;
                            padding: 0px;
                                  ">
                        <i class="glyphicon glyphicon-remove" style="color: #337ab7"></i>
                    </button>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection
