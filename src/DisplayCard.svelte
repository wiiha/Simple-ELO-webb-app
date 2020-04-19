<script>
  export let dog;
  let src = dog.url;
  let id = dog.id;
</script>

<div class="box has-text-centered">
<p>ID: {id}</p>
  <figure class="image">
    <img {src} alt="picture of dog">
  </figure>
</div>
