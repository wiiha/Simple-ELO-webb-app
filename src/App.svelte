<script>
  import "../node_modules/bulma/css/bulma.min.css";
  import { dogs } from "./db.js";
  import RatingComponent from "./RatingComponent.svelte";

  let competitors = dogs;
  function updateState(event) {
    console.log(event.detail);
    competitors = event.detail;
  }
</script>

<!-- Navbar -->

<!-- Main -->
<!-- Main/ rate -->
<RatingComponent on:stateUpdate={updateState} {competitors} />
<!-- Main/ stats -->

<!-- Potential footer -->
<button class="button is-info" on:click={() => console.log(competitors)}>
  Log competitors
</button>
