<script>
  import { randomIntFromInterval } from "./utils.js";
  import DisplayCard from "./DisplayCard.svelte";
  export let competitors;
  let dogI = {};
  let dogII = {};

  function setRandomDogs() {
    const min = 0;
    const max = competitors.length - 1;
    dogI = competitors[randomIntFromInterval(min, max)];
    dogII = competitors[randomIntFromInterval(min, max)];
    if (dogI.id === dogII.id) {
      console.log("Same was choosen");

      setRandomDogs();
    }
  }
  setRandomDogs();

  function cardChosen(event) {
    const idChosenDog = event.detail;
    console.log(dogI, dogII);

    // calcs for points

    // write new data to app state

    // change pair of dogs
    setRandomDogs();
  }
</script>

<section class="section">
  <div class="container">
    <div class="columns">
      <div class="column">
        <DisplayCard on:cardPressed={cardChosen} {...dogI} />
      </div>
      <div class="column">
        <DisplayCard on:cardPressed={cardChosen} {...dogII} />
      </div>
    </div>
  </div>
</section>
