<script>
  import "../node_modules/bulma/css/bulma.min.css";
  import { dogs } from "./db.js";
  import { randomIntFromInterval } from "./utils.js";

  import DisplayCard from "./DisplayCard.svelte";

  let competitors = dogs;
  let testDog = dogs[0];

  console.log("Running");
  console.log("competitors", competitors);
  

</script>

<section class="section">
  <div class="container">
    <div class="columns">
      <div class="column">
        <DisplayCard dog={testDog} />
      </div>
      <div class="column">Second column</div>
    </div>
  </div>
</section>
