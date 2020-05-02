<script>
  import { createEventDispatcher } from "svelte";
  import { randomIntFromInterval } from "./utils.js";
  import { newRatings } from "./elo.js";
  import DisplayCard from "./DisplayCard.svelte";
  const dispatch = createEventDispatcher();
  export let competitors;

  let dogI = {};
  let dogII = {};
  let userHasChoosenAtleastOnce = false;
  let userInactiveTimer;

  function setRandomDogs() {
    const min = 0;
    const max = competitors.length - 1;
    dogI = competitors[randomIntFromInterval(min, max)];
    dogII = competitors[randomIntFromInterval(min, max)];
    if (dogI.id === dogII.id) {
      // console.log("Same was choosen");
      setRandomDogs();
    }
  }

  function setNewScores(event, competitors, playerOne, playerTwo) {
    const idChosenDog = event.detail;
    const winner = idChosenDog === playerOne.id ? 1 : 0;

    // calcs for points
    const newScore = newRatings(playerOne.score, playerTwo.score, winner);

    // Update competitors
    playerOne.score = newScore.player1;
    playerTwo.score = newScore.player2;

    competitors.forEach(dog => {
      if (dog.id === playerOne.id) {
        dog.score = playerOne.score;
      } else if (dog.id === playerTwo.id) {
        dog.score = playerTwo.score;
      }
    });

    // competitors = [...competitors];

    // write new data to app state
    dispatch("stateUpdate", competitors);
    // change pair of dogs
    setRandomDogs();
  }

  function cardChosen(event) {
    removeInfoText();
    setNewScores(event, competitors, dogI, dogII);
  }

  function removeInfoText() {
    userHasChoosenAtleastOnce = true;
    clearTimeout(userInactiveTimer);
    // Timer "leak" if change to other tab. However no error message shown.
    userInactiveTimer = setTimeout(() => {
      userHasChoosenAtleastOnce = false;
    }, 4000);
  }

  setRandomDogs();
</script>

{#if !userHasChoosenAtleastOnce}
  <div class="column has-text-centered has-text-info">
    <div class="notification is-success">
      <h4 class="title is-4">Click the dog that you think is cuter.</h4>
    </div>
  </div>
{/if}
<div class="columns">
  <div class="column">
    <DisplayCard on:cardPressed={cardChosen} {...dogI} />
  </div>
  <div class="column">
    <DisplayCard on:cardPressed={cardChosen} {...dogII} />
  </div>
</div>
