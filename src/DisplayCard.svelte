<script>
  import { createEventDispatcher } from "svelte";
  export let url;
  export let id;
  export let score;
  export let showScore = false;

  const dispatch = createEventDispatcher();
  let src = url;

  function cardChosen() {
    dispatch("cardPressed", id);
  }
</script>

<style>
  .box {
    max-width: 900px;
  }
</style>

<div on:click={cardChosen} class="box has-text-centered">
  <p>ID: {id}</p>
  <figure class="image">
    <img src={url} alt="picture of a dog" />
  </figure>
  {#if showScore}
    <p>Score: {score}</p>
  {/if}
</div>
