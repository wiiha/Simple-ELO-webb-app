<script>
  import DisplayCard from "./DisplayCard.svelte";
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
    console.log("sortedList", sortedList);

    return sortedList;
  }
</script>

{#each sortList(competitors) as competitor}
  <dic class="columns">
    <div class="column">
      <DisplayCard {...competitor} showScore={true} />
    </div>
  </dic>
{/each}
