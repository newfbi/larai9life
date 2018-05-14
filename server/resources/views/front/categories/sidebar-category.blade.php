<div class="dropdown">
  <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Categorias
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    @foreach($categories as $category)
    <a class="dropdown-item" href="{{ route('front.category.slug', $category->slug) }}">{{ $category->name }}</a>
    @endforeach
  </div>
</div>            