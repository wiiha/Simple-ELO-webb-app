<script>
  import "../node_modules/bulma/css/bulma.min.css";
  import { dogs } from "./db.js";
  import RatingComponent from "./RatingComponent.svelte";
  import DisplayStats from "./DisplayStats.svelte";
  let currentRoute = "rate";
  let competitors = dogs;
  function updateState(event) {
    // console.log(event.detail);
    competitors = event.detail;
  }
  function navigate(route) {
    // console.log(route);
    currentRoute = route;
  }
</script>

<style>
.section{
  padding-top: 0;
  padding-bottom: 0;
}

</style>

<!-- Navbar -->
<div class="tabs is-centered">
  <ul>
    <li
      class={currentRoute === 'rate' ? 'is-active' : ''}
      on:click={() => {
        navigate('rate');
      }}>
      <a>Rate</a>
    </li>
    <li
      class={currentRoute === 'scoreboard' ? 'is-active' : ''}
      on:click={() => {
        navigate('scoreboard');
      }}>
      <a>Scoreboard</a>
    </li>
  </ul>
</div>
<!-- Main -->
<section class="section">
  <div class="container">

    <!-- Main/ rate -->
    {#if currentRoute === 'rate'}
      <RatingComponent on:stateUpdate={updateState} {competitors} />
    {/if}
    <!-- Main/ stats -->
    {#if currentRoute === 'scoreboard'}
      <DisplayStats {competitors} />
    {/if}
  </div>
</section>

<!-- Potential footer -->
<!-- <button class="button is-info" on:click={() => console.log(competitors)}>
  Log competitors
</button> -->
