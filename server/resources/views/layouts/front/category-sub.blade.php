<div class="dropdown show">
	<a class="btn dropdown-toggle" href="{{route('front.category.slug', $category->slug)}}" role="button" id="{{$category->slug}}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	{{$category->name}}
	</a>
	<div class="dropdown-menu" aria-labelledby="{{$category->slug}}">
	@foreach($subs as $sub)
		<a class="dropdown-item" href="{{route('front.category.slug', $sub->slug)}}">{{$sub->name}}</a> 
	@endforeach
	</div>
</div>