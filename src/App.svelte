<script>
  import "../node_modules/bulma/css/bulma.min.css";
  import { dogs } from "./db.js";
  import RatingComponent from "./RatingComponent.svelte";

  let competitors = dogs;
</script>

<!-- Navbar -->

<!-- Main -->
<!-- Main/ rate -->
<RatingComponent {competitors} />
<!-- Main/ stats -->

<!-- Potential footer -->
