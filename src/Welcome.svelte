<script>
  export let navigate = () => {};
</script>

<section class="hero is-medium is-primary is-bold is-fullheight">
  <div class="hero-body">
    <div class="container">
      <h1 class="title">Welcome to Dog rate</h1>
      <h2 class="subtitle">
        A webb app implementing the ELO rating algorithm, built with SvelteJS
        and Bulma!
      </h2>
      <button
        on:click={() => {
          navigate('rate');
        }}
        class="button is-primary is-inverted is-outlined is-large">
        Start rating
      </button>
    </div>
  </div>
</section>
