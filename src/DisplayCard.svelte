<script>
  export let url;
  export let id;
  export let score;
  let src = url;
</script>

<div class="box has-text-centered">
  <p>ID: {id}</p>
  <figure class="image">
    <img src={url} alt="picture of a dog" />
  </figure>
</div>
