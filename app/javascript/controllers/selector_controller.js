import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["form"];

  submit() {
    console.log(this.formTarget);
    if (this.formTarget) this.formTarget.requestSubmit();
  }
}
