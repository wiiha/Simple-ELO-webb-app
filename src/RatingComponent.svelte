<script>
  import { createEventDispatcher } from "svelte";
  import { randomIntFromInterval } from "./utils.js";
  import { newRatings } from "./elo.js";
  import DisplayCard from "./DisplayCard.svelte";
  const dispatch = createEventDispatcher();
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
    const winner = idChosenDog === dogI.id ? 1 : 0;

    // calcs for points
    const newScore = newRatings(dogI.score, dogII.score, winner);

    // Update competitors
    dogI.score = newScore.player1;
    dogII.score = newScore.player2;

    competitors.forEach(dog => {
      if (dog.id === dogI.id) {
        dog.score = dogI.score;
      } else if (dog.id === dogII.id) {
        dog.score = dogII.score;
      }
    });

    competitors = [...competitors];

    // write new data to app state
    dispatch("stateUpdate", competitors);
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
