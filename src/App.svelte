<script>
  import "../node_modules/bulma/css/bulma.min.css";
  import { dogs } from "./db.js";
  import { randomIntFromInterval } from "./utils.js";

  import DisplayCard from "./DisplayCard.svelte";

  let competitors = dogs;
  let dogI = {};
  let dogII = {};

  console.log("Running");
  console.log("competitors", competitors);
  console.log("randomIntFromInterval", randomIntFromInterval(0, 7));

  function setRandomDogs() {
    const min = 0;
    const max = competitors.length - 1;
    console.log(min, max);
    dogI = dogs[randomIntFromInterval(min, max)];
    dogII = dogs[randomIntFromInterval(min, max)];
    if (dogI.id === dogII.id) {
      console.log("Same was choosen");

      setRandomDogs();
    }
  }
  setRandomDogs();
</script>

<!-- Navbar -->

<!-- Main -->

<!-- Potential footer -->

<section class="section">
  <div class="container">
    <div class="columns">
      <div class="column">
        <DisplayCard {...dogI} />
      </div>
      <div class="column">
        <DisplayCard {...dogII} />
      </div>

    </div>
    <div class="columns">
      <div class="column">
        <button class="button is-warning" on:click={setRandomDogs}>
          New pair
        </button>
      </div>
      <div class="column">
      one: {dogI.id}
      two: {dogII.id}
      </div>
    </div>
  </div>
</section>
