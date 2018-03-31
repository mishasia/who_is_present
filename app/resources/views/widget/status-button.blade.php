<div>
    <link  href="{{ asset('css/style.css') }}" rel="stylesheet" >
    <input
            data-id="{{ Auth::user()->id }}"
            data-is_present="{{ Auth::user()->teacher->is_present }}"
            class="checkbox"
            type="checkbox"
            id="codepen"
    />
    <label for="codepen"></label>
</div>