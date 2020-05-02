<script>
  import DisplayCard from "./DisplayCard.svelte";
  import SectionContainer from "./partial/SectionContainer.svelte";
  export let competitors = [];

  function sortList(list) {
    const sortedList = list.sort((a, b) => {
      if (a.score > b.score) {
        return -1;
      }
      if (a.score < b.score) {
        return 1;
      }
      if (a.score === b.score) {
        return 0;
      }
    });
    //console.log("sortedList", sortedList);

    return sortedList;
  }
</script>

<SectionContainer>

  {#each sortList(competitors) as competitor}
    <div class="columns">
      <div class="column is-hidden-mobile" />
      <!-- <div class="column is-four-fifths"> -->
      <div class="column">
        <DisplayCard {...competitor} showScore={true} />
      </div>
      <div class="column is-hidden-mobile" />
    </div>
  {/each}

</SectionContainer>
